import 'dart:convert';

import 'package:anime_character_tierlist/src/exceptions/mal_exception.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:jikan_api/jikan_api.dart';

final malRepositoryProvider = Provider<MalRepository>((ref) {
  return MalRepository();
});

class MalRepository {
  final Jikan jikan = Jikan();

  Future<List<Anime>> getUserAnime({
    required String userName,
    required String status,
    required String accessToken,
  }) async {
    String? url =
        'https://api.myanimelist.net/v2/users/$userName/animelist?status=$status&sort=list_score&limit=100&offset=0';
    List<Anime> animeList = [];
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
      if (json case {
        'data': List<dynamic> data,
        'paging': {'next': String? nextUrl},
      }) {
        url = nextUrl;
        // TODO: Implement custom Anime class
        animeList.addAll(List<Anime>.from(data.map((x) => Anime.fromJson(x))));
      } else {
        url = null;
        animeList.addAll(
          List<Anime>.from(json['data'].map((x) => Anime.fromJson(x))),
        );
      }
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
}

final malServiceProvider = Provider<MalService>((ref) {
  return MalService(ref.watch(malRepositoryProvider));
});

class MalService {
  final MalRepository _repository;

  MalService(this._repository);

  Future<List<Anime>> getUserAnime({
    required String userName,
    required String status,
    required String accessToken,
  }) async {
    return _repository.getUserAnime(
      userName: userName,
      status: status,
      accessToken: accessToken,
    );
  }

  Future<String> fetchUsername(String accessToken) async {
    return _repository.fetchUsername(accessToken);
  }
}
