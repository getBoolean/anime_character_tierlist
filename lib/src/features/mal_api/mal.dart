import 'dart:convert';

import 'package:anime_character_tierlist/src/exceptions/mal_exception.dart';
import 'package:anime_character_tierlist/src/features/mal_api/mal_models.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:jikan_api/jikan_api.dart' as j;

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
      final response = await http.get(
        Uri.parse(url!),
        headers: {'Authorization': 'Bearer $accessToken'},
      );
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
    final url = Uri.parse('https://api.myanimelist.net/v2/users/@me');
    final http.Response response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['name'];
    } else {
      if (kDebugMode) print('Failed to get username: ${response.body}');
      throw MalException('Failed to get username', response);
    }
  }

  Future<j.BuiltList<j.CharacterMeta>> fetchAnimeCharacters(int animeId) async {
    return await jikan.getAnimeCharacters(animeId);
  }

  Future<j.BuiltList<j.Picture>> fetchCharacterPictures(int characterId) async {
    return await jikan.getCharacterPictures(characterId);
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
