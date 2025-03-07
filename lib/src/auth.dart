import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

final authProvider = ChangeNotifierProvider<AuthNotifier>(
  (ref) => AuthNotifier(),
);

class AuthNotifier extends ChangeNotifier {
  AsyncValue<AuthNotifierState> state = AsyncValue.data(AuthNotifierState());

  late final FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  final String _clientId = '1c9a747601ef32d03d54067890189509';
  // final String _clientSecret =
  //     '14b9296d7b74983d13a714d7bbb568a6381a04a56119ab6c8946576d0a7f6e8f';
  final String _redirectUri =
      'dev.getboolean.anime-character-tierlist://oauth2redirect';

  AuthNotifier() {
    _loadTokens();
  }

  String _generateCodeVerifier([int length = 128]) {
    final random = Random.secure();
    return base64UrlEncode(
      List.generate(length, (_) => random.nextInt(256)),
    ).split('=')[0];
  }

  String _generateCodeChallenge(String verifier) {
    return base64UrlEncode(
      sha256.convert(ascii.encode(verifier)).bytes,
    ).split('=')[0];
  }

  Future<void> _loadTokens() async {
    try {
      final accessToken = await _storage.read(key: 'access_token');
      final refreshToken = await _storage.read(key: 'refresh_token');
      final username = await _storage.read(key: 'username');

      if (accessToken != null && refreshToken != null) {
        state = await AsyncValue.guard(
          () => _refreshAccessToken(accessToken, refreshToken, username),
        );
      } else {
        state = AsyncValue.data(AuthNotifierState.empty());
      }
    } catch (e) {
      if (kDebugMode) print('Error loading tokens: $e');
      state = AsyncValue.data(AuthNotifierState.empty());
    }
    notifyListeners();
  }

  bool get isLoggedIn => state.unwrapPrevious().value?.credential != null;

  Future<void> login() async {
    final codeVerifier = _generateCodeChallenge(_generateCodeVerifier());
    await _storage.delete(key: 'code_verifier');
    _storage.write(key: 'code_verifier', value: codeVerifier);
    final url =
        'https://myanimelist.net/v1/oauth2/authorize?response_type=code&client_id=$_clientId&code_challenge=$codeVerifier&code_challenge_method=plain&redirect_uri=$_redirectUri';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> exchangeCodeForToken(String authorizationCode) async {
    state = const AsyncValue.loading();
    try {
      final url = Uri.parse('https://myanimelist.net/v1/oauth2/token');
      final codeVerifier = await _storage.read(key: 'code_verifier');
      if (codeVerifier == null) {
        throw StateError('Code verifier not found');
      }
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'client_id': _clientId,
          // 'client_secret': _clientSecret,
          'code': authorizationCode,
          'code_verifier': codeVerifier,
          'grant_type': 'authorization_code',
          'redirect_uri': _redirectUri,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final accessToken = data['access_token'];
        final refreshToken = data['refresh_token'];
        final username = await _fetchUsername(accessToken);
        await _saveTokens(accessToken, refreshToken, username);
        state = AsyncValue.data(
          AuthNotifierState(
            credential: Credential(
              accessToken: accessToken,
              refreshToken: refreshToken,
              username: username,
            ),
          ),
        );
      } else {
        if (kDebugMode) print('Failed to get access token: ${response.body}');
        state = AsyncValue.error('Login failed.', StackTrace.current);
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
    notifyListeners();
  }

  Future<String> _fetchUsername(String accessToken) async {
    final url = Uri.parse('https://api.myanimelist.net/v2/users/@me');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['name'];
    } else {
      if (kDebugMode) print('Failed to get username: ${response.body}');
      throw Exception('Failed to get username');
    }
  }

  Future<void> _saveTokens(
    String accessToken,
    String refreshToken,
    String username,
  ) async {
    await _storage.write(key: 'access_token', value: accessToken);
    await _storage.write(key: 'refresh_token', value: refreshToken);
    await _storage.write(key: 'username', value: username);
  }

  Future<AuthNotifierState> _refreshAccessToken(
    String accessToken,
    String refreshToken,
    String? username,
  ) async {
    try {
      final url = Uri.parse('https://myanimelist.net/v1/oauth2/token');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'grant_type': 'refresh_token',
          'refresh_token': refreshToken,
          'client_id': _clientId,
          // 'client_secret': _clientSecret,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final newAccessToken = data['access_token'];
        final newRefreshToken = data['refresh_token'];
        await _saveTokens(newAccessToken, newRefreshToken, username!);
        return AuthNotifierState(
          credential: Credential(
            accessToken: newAccessToken,
            refreshToken: newRefreshToken,
            username: username,
          ),
        );
      } else {
        if (kDebugMode) {
          print('Failed to refresh access token: ${response.body}');
        }
        await _clearTokens();
        return AuthNotifierState.empty();
      }
    } catch (e) {
      if (kDebugMode) print("refresh token error: $e");
      await _clearTokens();
      return AuthNotifierState.empty();
    }
  }

  Future<void> _clearTokens() async {
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');
    await _storage.delete(key: 'username');
    state = AsyncValue.data(AuthNotifierState.empty());
  }

  Future<void> logout() async {
    await _clearTokens();
    notifyListeners();
  }
}

class Credential {
  final String accessToken;
  final String refreshToken;
  final String username;

  const Credential({
    required this.accessToken,
    required this.refreshToken,
    required this.username,
  });
}

class AuthNotifierState {
  final Credential? credential;
  factory AuthNotifierState.empty() =>
      const AuthNotifierState(credential: null);

  const AuthNotifierState({this.credential});
}
