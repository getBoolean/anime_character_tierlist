import 'dart:convert';
import 'dart:math';

import 'package:anime_character_tierlist/src/exceptions/mal_exception.dart';
import 'package:anime_character_tierlist/src/features/mal.dart';
import 'package:app_links/app_links.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

class AuthRepository {
  AuthRepository();

  Future<({String accessToken, String refreshToken})> exchangeCodeForToken({
    required String authorizationCode,
    required String codeVerifier,
    required String clientId,
    required String redirectUri,
    String? clientSecret,
  }) async {
    final url = Uri.parse('https://myanimelist.net/v1/oauth2/token');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'client_id': clientId,
        if (clientSecret != null) 'client_secret': clientSecret,
        'code': authorizationCode,
        'code_verifier': codeVerifier,
        'grant_type': 'authorization_code',
        'redirect_uri': redirectUri,
      },
    );
    if (response.statusCode != 200) {
      if (kDebugMode) {
        print('Failed to exchange code for token: ${response.body}');
      }
      throw Exception('Failed to exchange code for token');
    }
    final data = json.decode(response.body);
    if (data case {
      'access_token': String accessToken,
      'refresh_token': String refreshToken,
    }) {
      return (accessToken: accessToken, refreshToken: refreshToken);
    } else {
      if (kDebugMode) print('Failed to get access token: ${response.body}');
      throw Exception('Failed to get access token');
    }
  }

  Future<({String accessToken, String refreshToken})> refreshAccessToken({
    required String refreshToken,
    required String clientId,
    String? clientSecret,
  }) async {
    final url = Uri.parse('https://myanimelist.net/v1/oauth2/token');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'grant_type': 'refresh_token',
        'refresh_token': refreshToken,
        'client_id': clientId,
        if (clientSecret != null) 'client_secret': clientSecret,
      },
    );

    if (response.statusCode != 200) {
      if (kDebugMode) {
        print('Failed to refresh access token: ${response.body}');
      }
      throw Exception('Failed to refresh access token');
    }
    final data = json.decode(response.body);
    if (data case {
      'access_token': String accessToken,
      'refresh_token': String refreshToken,
    }) {
      return (accessToken: accessToken, refreshToken: refreshToken);
    } else {
      if (kDebugMode) print('Failed to get access token: ${response.body}');
      throw Exception('Failed to get access token');
    }
  }

  Future<void> launchLoginUrl({
    required String codeVerifier,
    required String clientId,
    required String redirectUrl,
  }) async {
    final url =
        'https://myanimelist.net/v1/oauth2/authorize?response_type=code&client_id=$clientId&code_challenge=$codeVerifier&code_challenge_method=plain&redirect_uri=$redirectUrl';

    if (await canLaunchUrl(Uri.parse(url))) {
      bool success = await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
      if (!success) {
        throw Exception('Failed to launch $url');
      }
    } else {
      throw Exception('Could not launch $url');
    }
  }
}

final initialAppLinkProvider = FutureProvider<Uri?>((ref) async {
  final appLinks = AppLinks();
  return await appLinks.getInitialLink();
});

final appLinksStreamProvider = StreamProvider<Uri>((ref) async* {
  final appLinks = AppLinks();
  yield* appLinks.uriLinkStream;
});

final authNotifierProvider =
    AsyncNotifierProvider<AuthNotifier, AuthNotifierState>(() {
      return AuthNotifier();
    });

class AuthNotifier extends AsyncNotifier<AuthNotifierState> {
  @override
  Future<AuthNotifierState> build() async {
    final initialAppLink = await ref.watch(initialAppLinkProvider.future);
    if (initialAppLink != null) {
      _handleUrl(initialAppLink);
    }
    final appLink = ref.watch(appLinksStreamProvider);
    appLink.whenData((uri) {
      _handleUrl(uri);
    });
    return await _loadTokens();
  }

  void _handleUrl(Uri uri) {
    if (uri.scheme == 'dev.getboolean.anime-character-tierlist' &&
        uri.host == 'oauth2redirect') {
      final code = uri.queryParameters['code'];
      if (code != null) {
        exchangeCodeForToken(code);
      }
    }
  }

  static final FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  static final String _clientId = '1c9a747601ef32d03d54067890189509';
  // static final String _clientSecret =
  //     '14b9296d7b74983d13a714d7bbb568a6381a04a56119ab6c8946576d0a7f6e8f';
  static final String _redirectUrl =
      'dev.getboolean.anime-character-tierlist://oauth2redirect';

  Future<AuthNotifierState> _loadTokens() async {
    try {
      final accessToken = await _storage.read(key: 'access_token');
      final refreshToken = await _storage.read(key: 'refresh_token');
      final username = await _storage.read(key: 'username');
      if (accessToken == null || refreshToken == null || username == null) {
        return AuthNotifierState.empty();
      }
      return AuthNotifierState(
        credential: Credential(
          accessToken: accessToken,
          refreshToken: refreshToken,
          username: username,
        ),
      );
    } catch (e) {
      if (kDebugMode) print('Error loading tokens: $e');
      return AuthNotifierState.empty();
    }
  }

  Future<void> saveCodeVerifier(String codeVerifier) async {
    await _storage.delete(key: 'code_verifier');
    await _storage.write(key: 'code_verifier', value: codeVerifier);
  }

  Future<void> login() async {
    final codeVerifier = _generateCodeChallenge(_generateCodeVerifier());
    await saveCodeVerifier(codeVerifier);
    await ref
        .read(authRepositoryProvider)
        .launchLoginUrl(
          codeVerifier: codeVerifier,
          clientId: _clientId,
          redirectUrl: _redirectUrl,
        );
  }

  static String _generateCodeVerifier([int length = 128]) {
    final random = Random.secure();
    return base64UrlEncode(
      List.generate(length, (_) => random.nextInt(256)),
    ).split('=')[0];
  }

  static String _generateCodeChallenge(String verifier) {
    return base64UrlEncode(
      sha256.convert(ascii.encode(verifier)).bytes,
    ).split('=')[0];
  }

  Future<T> retry<T>(Future<T> Function(String accessToken) function) async {
    final refreshToken = await _storage.read(key: 'refresh_token');
    if (refreshToken == null) {
      throw StateError('Refresh token not found');
    }

    final accessToken = await _storage.read(key: 'access_token');
    if (accessToken == null) {
      throw StateError('Access token not found');
    }
    try {
      return await function(accessToken);
    } on MalException catch (e) {
      if (e.response.statusCode == 401 &&
          (e.response.headers['www-authenticate']?.contains('invalid_token') ??
              false)) {
        await _refreshAccessToken(refreshToken, accessToken);
        final newAccessToken = await _storage.read(key: 'access_token');
        if (newAccessToken == null) {
          throw StateError('Access token not found');
        }
        return await function(newAccessToken);
      } else {
        rethrow;
      }
    }
  }

  Future<void> exchangeCodeForToken(String authorizationCode) async {
    state = const AsyncValue.loading();
    final codeVerifier = await _storage.read(key: 'code_verifier');
    if (codeVerifier == null) {
      throw StateError('Code verifier not found');
    }
    final (accessToken: accessToken, refreshToken: refreshToken) = await ref
        .read(authRepositoryProvider)
        .exchangeCodeForToken(
          authorizationCode: authorizationCode,
          codeVerifier: codeVerifier,
          clientId: _clientId,
          redirectUri: _redirectUrl,
        );
    try {
      final username = await retry(
        ref.read(malRepositoryProvider).fetchUsername,
      );
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
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  static Future<void> _saveTokens(
    String accessToken,
    String refreshToken,
    String username,
  ) async {
    await _storage.write(key: 'access_token', value: accessToken);
    await _storage.write(key: 'refresh_token', value: refreshToken);
    await _storage.write(key: 'username', value: username);
  }

  Future<AuthNotifierState> _refreshAccessToken(
    String refreshToken,
    String username,
  ) async {
    try {
      final (
        accessToken: newAccessToken,
        refreshToken: newRefreshToken,
      ) = await ref
          .read(authRepositoryProvider)
          .refreshAccessToken(refreshToken: refreshToken, clientId: _clientId);
      await _saveTokens(newAccessToken, newRefreshToken, username);
      return AuthNotifierState(
        credential: Credential(
          accessToken: newAccessToken,
          refreshToken: newRefreshToken,
          username: username,
        ),
      );
    } catch (e) {
      if (kDebugMode) print("refresh token error: $e");
      await logout();
      return AuthNotifierState.empty();
    }
  }

  Future<void> logout() async {
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');
    await _storage.delete(key: 'username');
    state = AsyncValue.data(AuthNotifierState.empty());
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref);
});

class AuthService {
  final Ref _ref;

  AuthService(this._ref);

  Future<void> login() async {
    await _ref.read(authNotifierProvider.notifier).login();
  }

  Future<void> logout() async {
    await _ref.read(authNotifierProvider.notifier).logout();
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

  bool get isLoggedIn => credential != null;
}
