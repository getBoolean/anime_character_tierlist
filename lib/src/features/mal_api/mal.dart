import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;
import 'dart:math' as math;

import 'package:anime_character_tierlist/src/exceptions/mal_exception.dart';
import 'package:anime_character_tierlist/src/features/mal_api/mal_models.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:jikan_api/jikan_api.dart' as j;
import 'package:rate_limiter/rate_limiter.dart';
import 'package:token_bucket/token_bucket.dart';

final malRepositoryProvider = Provider<MalRepository>((ref) {
  return MalRepository();
});

class MalRepository {
  final j.Jikan jikan = j.Jikan();

  Future<List<MalUserAnime>> getUserAnime({
    required String userName,
    required String status,
    required String accessToken,
  }) async {
    String? url =
        'https://api.myanimelist.net/v2/users/$userName/animelist?status=$status&sort=list_score&limit=100&offset=0';
    List<MalUserAnime> animeList = [];
    do {
      final response = await get(url!, accessToken: accessToken);
      if (response.statusCode != 200) {
        throw Exception('Failed to load user anime');
      }

      // TODO: Test what paging looks like for final page
      final json = jsonDecode(response.body);
      final animeResultPage = MalPage<MalUserAnime>.fromJson(json);
      url = animeResultPage.paging.next;
      animeList.addAll(animeResultPage.data);
    } while (url != null && url.isNotEmpty);

    return animeList;
  }

  Future<String> fetchUsername(String accessToken) async {
    final http.Response response = await get(
      'https://api.myanimelist.net/v2/users/@me',
      accessToken: accessToken,
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['name'];
    } else {
      if (kDebugMode) print('Failed to get username: ${response.body}');
      throw MalException('Failed to get username', response);
    }
  }

  Future<http.Response> get(
    String url, {
    required String accessToken,
    Map<String, String>? headers,
  }) async {
    return await throttle(
      () async => await http.get(
        Uri.parse(url),
        headers:
            (headers ?? {})..addAll({'Authorization': 'Bearer $accessToken'}),
      ),
    );
  }

  Future<http.Response> getUnauthenticated(
    String url, {
    required String clientId,
    Map<String, String>? headers,
  }) async {
    return await http.get(
      Uri.parse(url),
      headers: (headers ?? {})..addAll({'X-MAL-CLIENT-ID': clientId}),
    );
  }

  Future<j.BuiltList<j.CharacterMeta>> fetchAnimeCharacters(int animeId) async {
    return await throttle(() async => await jikan.getAnimeCharacters(animeId));
  }

  Future<j.BuiltList<j.Picture>> fetchCharacterPictures(int characterId) async {
    return await throttle(
      () async => await jikan.getCharacterPictures(characterId),
    );
  }

  final minuteBucket = TokenBucket(
    capacity: 60,
    frequency: RefillFrequency.minute,
    storage: MemoryBucketStorage(),
  );

  final secondsBucket = TokenBucket(
    capacity: 3,
    frequency: RefillFrequency.second,
    storage: MemoryBucketStorage(),
  );

  Future<T> throttle<T>(Future<T> Function() fetcher) async {
    Duration waitDuration = Duration.zero;
    do {
      final minuteState = await minuteBucket.consume(
        bucketId: 'jikan',
        coast: 1,
      );
      final secondsState = await secondsBucket.consume(
        bucketId: 'jikan',
        coast: 1,
      );
      Duration waitDuration = _getWaitDuration(minuteState, secondsState);
      if (waitDuration != Duration.zero) {
        await Future.delayed(waitDuration);
      }
    } while (waitDuration != Duration.zero);
    return backOff(
      () async => await fetcher().timeout(Duration(seconds: 8)),
      maxAttempts: 5,
      maxDelay: Duration(seconds: 5),
      retryIf: (e, _) => e is io.SocketException || e is TimeoutException,
    );
  }

  Duration _getWaitDuration(TokenState minuteState, TokenState secondsState) {
    final waitDuration = switch ((
      minuteStateConsumed: minuteState.consumed,
      secondsStateConsumed: secondsState.consumed,
    )) {
      (minuteStateConsumed: true, secondsStateConsumed: true) => Duration.zero,
      (minuteStateConsumed: true, secondsStateConsumed: false) => Duration(
        seconds: secondsState.remainToRefill,
      ),
      (minuteStateConsumed: false, secondsStateConsumed: true) => Duration(
        seconds: minuteState.remainToRefill,
      ),
      (minuteStateConsumed: false, secondsStateConsumed: false) => Duration(
        seconds: math.max(
          minuteState.remainToRefill,
          secondsState.remainToRefill,
        ),
      ),
    };
    return waitDuration;
  }
}

final malServiceProvider = Provider<MalService>((ref) {
  return MalService(ref.watch(malRepositoryProvider));
});

class MalService {
  final MalRepository _repository;

  MalService(this._repository);

  Future<List<MalUserAnime>> getUserAnime({
    required String userName,
    required String status,
    required String accessToken,
  }) async {
    return await _repository.getUserAnime(
      userName: userName,
      status: status,
      accessToken: accessToken,
    );
  }

  Future<String> fetchUsername(String accessToken) async {
    return await _repository.fetchUsername(accessToken);
  }
}
