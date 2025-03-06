import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyAnimeList Favorites',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _storage = FlutterSecureStorage();
  final _clientId = 'YOUR_CLIENT_ID'; // Replace with your MAL client ID
  final _codeVerifier = 'YOUR_CODE_VERIFIER'; // Generate and store securely
  final _codeChallenge = 'YOUR_CODE_CHALLENGE'; // Generate and store securely
  final _redirectUri = 'YOUR_REDIRECT_URI'; // Replace with your redirect URI

  Future<void> _login() async {
    final url =
        'https://myanimelist.net/v1/oauth2/authorize?response_type=code&client_id=$_clientId&code_challenge=$_codeChallenge&code_challenge_method=S256&redirect_uri=$_redirectUri';
    // Use a webview or external browser to open the URL.
    // After successful login, handle the redirect and extract the code.
    // For simplicity, this example assumes the code is manually entered.
    final code = await _showCodeInputDialog();

    if (code != null && code.isNotEmpty) {
      final tokenResponse = await _getToken(code);
      if (tokenResponse != null) {
        await _storage.write(
          key: 'access_token',
          value: tokenResponse['access_token'],
        );
        await _storage.write(
          key: 'refresh_token',
          value: tokenResponse['refresh_token'],
        );
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AnimeListScreen()),
          );
        }
      } else {
        // Handle token retrieval failure.
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Login failed')));
        }
      }
    }
  }

  Future<String?> _showCodeInputDialog() async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        String code = '';
        return AlertDialog(
          title: Text('Enter Authorization Code'),
          content: TextField(
            onChanged: (value) {
              code = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(code);
              },
            ),
          ],
        );
      },
    );
  }

  Future<Map<String, dynamic>?> _getToken(String code) async {
    final response = await http.post(
      Uri.parse('https://myanimelist.net/v1/oauth2/token'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'grant_type': 'authorization_code',
        'code': code,
        'client_id': _clientId,
        'code_verifier': _codeVerifier,
        'redirect_uri': _redirectUri,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: _login,
          child: Text('Login with MyAnimeList'),
        ),
      ),
    );
  }
}

class AnimeListScreen extends StatefulWidget {
  const AnimeListScreen({super.key});

  @override
  State<AnimeListScreen> createState() => _AnimeListScreenState();
}

class _AnimeListScreenState extends State<AnimeListScreen> {
  final _storage = FlutterSecureStorage();
  List<dynamic> _animeList = [];
  final Map<int, List<dynamic>> _favoriteCharacters = {};

  @override
  void initState() {
    super.initState();
    _fetchAnimeList();
  }

  Future<void> _fetchAnimeList() async {
    final accessToken = await _storage.read(key: 'access_token');
    if (accessToken == null) {
      // Handle missing token (e.g., redirect to login).
      return;
    }

    final response = await http.get(
      Uri.parse(
        'https://api.myanimelist.net/v2/users/@me/animelist?status=completed,watching&sort=list_score&limit=50&fields=list_status',
      ),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _animeList =
            data['data']
                .where(
                  (anime) =>
                      anime['list_status']['score'] >= 6 &&
                      anime['node'] != null &&
                      anime['node']['id'] != null,
                )
                .toList();
      });
      _fetchCharacters();
    } else if (response.statusCode == 401) {
      _refreshAccessToken();
    } else {
      // Handle error.
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to fetch anime list')));
      }
    }
  }

  Future<void> _refreshAccessToken() async {
    final refreshToken = await _storage.read(key: 'refresh_token');
    final clientId = 'YOUR_CLIENT_ID'; // Replace with your client ID

    if (refreshToken == null) {
      // Handle missing refresh token (e.g., redirect to login).
      return;
    }

    final response = await http.post(
      Uri.parse('https://myanimelist.net/v1/oauth2/token'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'grant_type': 'refresh_token',
        'refresh_token': refreshToken,
        'client_id': clientId,
      },
    );

    if (response.statusCode == 200) {
      final tokenResponse = json.decode(response.body);
      await _storage.write(
        key: 'access_token',
        value: tokenResponse['access_token'],
      );
      await _storage.write(
        key: 'refresh_token',
        value: tokenResponse['refresh_token'],
      );
      _fetchAnimeList(); // Retry fetching anime list.
    } else {
      // Handle refresh token failure (e.g., redirect to login).
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to refresh token')));
      }
    }
  }

  Future<void> _fetchCharacters() async {
    for (var anime in _animeList) {
      final animeId = anime['node']['id'];
      final accessToken = await _storage.read(key: 'access_token');
      final response = await http.get(
        Uri.parse('https://api.myanimelist.net/v2/anime/$animeId/characters'),
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final characters = data['data'];
        _selectFavoriteCharacters(animeId, characters);
      }
    }
  }

  Future<void> _selectFavoriteCharacters(
    int animeId,
    List<dynamic> characters,
  ) async {
    List<dynamic> favorites = [];
    for (var character in characters) {
      bool isFavorite = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Is ${character['node']['name']} a favorite character?',
            ),
            actions: <Widget>[
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );
      if (isFavorite == true) {
        favorites.add(character);
      }
    }
    setState(() {
      _favoriteCharacters[animeId] = favorites;
    });
    _saveFavoritesToCache();
    if (mounted && _favoriteCharacters.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => CharacterRankingScreen(
                favoriteCharacters: _favoriteCharacters,
              ),
        ),
      );
    }
  }

  Future<void> _saveFavoritesToCache() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/favorites.json');
    await file.writeAsString(json.encode(_favoriteCharacters));
  }

  Future<Map<int, List<dynamic>>> _loadFavoritesFromCache() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/favorites.json');
      if (await file.exists()) {
        final contents = await file.readAsString();
        return Map<int, List<dynamic>>.from(json.decode(contents));
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading favorites: $e');
      }
    }
    return {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Anime List')),
      body:
          _animeList.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: _animeList.length,
                itemBuilder: (context, index) {
                  final anime = _animeList[index]['node'];
                  return ListTile(
                    title: Text(anime['title']),
                    subtitle: Text(
                      'Score: ${_animeList[index]['list_status']['score']}',
                    ),
                  );
                },
              ),
    );
  }
}

class CharacterRankingScreen extends StatefulWidget {
  final Map<int, List<dynamic>> favoriteCharacters;

  const CharacterRankingScreen({super.key, required this.favoriteCharacters});

  @override
  State<CharacterRankingScreen> createState() => _CharacterRankingScreenState();
}

class _CharacterRankingScreenState extends State<CharacterRankingScreen> {
  List<dynamic> _rankedCharacters = [];
  int _currentAnimeIndex = 0;
  List<int> _animeIds = [];

  @override
  void initState() {
    super.initState();
    _animeIds = widget.favoriteCharacters.keys.toList();
    _loadNextAnimeCharacters();
  }

  void _loadNextAnimeCharacters() {
    if (_currentAnimeIndex < _animeIds.length) {
      _rankedCharacters = List.from(
        widget.favoriteCharacters[_animeIds[_currentAnimeIndex]]!,
      );
    } else {
      // All anime processed.
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Character ranking complete!')));
    }
  }

  void _nextAnime() {
    setState(() {
      _currentAnimeIndex++;
      _loadNextAnimeCharacters();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_rankedCharacters.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Character Ranking')),
        body: Center(child: Text("No favorites found for this anime.")),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text('Character Ranking')),
      body: ReorderableListView.builder(
        itemCount: _rankedCharacters.length,
        itemBuilder: (context, index) {
          final character = _rankedCharacters[index]['node'];
          return ListTile(
            key: ValueKey(character['id']),
            leading:
                character['picture'] != null
                    ? Image.network(character['picture'])
                    : Icon(Icons.person),
            title: Text(character['name']),
            subtitle: Text('Rank: ${index + 1}'),
          );
        },
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final character = _rankedCharacters.removeAt(oldIndex);
            _rankedCharacters.insert(newIndex, character);
          });
        },
      ),
      floatingActionButton:
          _currentAnimeIndex < _animeIds.length - 1
              ? FloatingActionButton(
                onPressed: _nextAnime,
                child: Icon(Icons.arrow_forward),
              )
              : null,
    );
  }
}
