import 'dart:convert';
import 'dart:io' as io;
import 'dart:math';

import 'package:anime_character_tierlist/src/env/env.dart';
import 'package:anime_character_tierlist/src/exceptions/auth_exception.dart';
import 'package:anime_character_tierlist/src/exceptions/mal_exception.dart';
import 'package:anime_character_tierlist/src/features/mal_api/mal.dart';
import 'package:app_links/app_links.dart';
import 'package:crypto/crypto.dart';
import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

class AuthRepository {
  AuthRepository();

  Future<Credential> exchangeCodeForToken({
    required String authorizationCode,
    required String codeVerifier,
    required String clientId,
    required String redirectUri,
  }) async {
    final url = Uri.https('myanimelist.net', 'v1/oauth2/token');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'client_id': clientId,
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
      throw MalException('Failed to exchange code for token', response);
    }
    final data = json.decode(response.body);
    if (data case {
      'access_token': String accessToken,
      'refresh_token': String refreshToken,
      'expires_in': int expiresIn,
      'token_type': String tokenType,
    }) {
      return Credential(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiresIn: expiresIn,
        tokenType: tokenType,
      );
    } else {
      if (kDebugMode) print('Failed to get access token: ${response.body}');
      throw MalException('Failed to get access token', response);
    }
  }

  Future<Credential> refreshAccessToken({
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
      throw MalException('Failed to refresh access token', response);
    }
    final data = json.decode(response.body);
    if (data case {
      'access_token': String accessToken,
      'refresh_token': String refreshToken,
      'expires_in': int expiresIn,
      'token_type': String tokenType,
    }) {
      return Credential(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiresIn: expiresIn,
        tokenType: tokenType,
      );
    } else {
      if (kDebugMode) print('Failed to get access token: ${response.body}');
      throw MalException('Failed to get access token', response);
    }
  }

  Future<Credential> launchLoginUrl({required String codeVerifier}) async {
    final clientId = Env.clientId;
    final String callbackUrlScheme;
    if (kIsWeb) {
      callbackUrlScheme = Env.webCallbackScheme;
    } else if (io.Platform.isWindows) {
      callbackUrlScheme = Env.windowsCallbackScheme;
    } else if (io.Platform.isLinux) {
      callbackUrlScheme = Env.linuxCallbackScheme;
    } else if (io.Platform.isMacOS) {
      callbackUrlScheme = Env.macosCallbackScheme;
    } else if (io.Platform.isIOS) {
      callbackUrlScheme = Env.iosCallbackScheme;
    } else if (io.Platform.isAndroid) {
      callbackUrlScheme = Env.androidCallbackScheme;
    } else {
      throw Exception('Unsupported platform');
    }
    final redirectUrl = '$callbackUrlScheme://oauth2redirect';
    final url = Uri.https('myanimelist.net', '/v1/oauth2/authorize', {
      'response_type': 'code',
      'client_id': clientId,
      'redirect_uri': redirectUrl,
      'code_challenge': codeVerifier,
      'code_challenge_method': 'plain',
    });

    // TODO: Include WebView2 Runtime in the build process. https://pub.dev/packages/desktop_webview_window#windows
    final isAvailable = await WebviewWindow.isWebviewAvailable();
    if (!isAvailable) {
      throw AuthException('WebView is not available');
    }
    final result = await FlutterWebAuth2.authenticate(
      url: url.toString(),
      callbackUrlScheme: callbackUrlScheme,
    );
    final code = Uri.parse(result).queryParameters['code'];
    if (code == null) {
      throw AuthException('Failed to get authorization code');
    }
    return await exchangeCodeForToken(
      authorizationCode: code,
      codeVerifier: codeVerifier,
      clientId: Env.clientId,
      redirectUri: redirectUrl,
    );
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
    await _checkExpiredToken();

    return await _loadTokens();
  }

  static final FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  Future<AuthNotifierState> _loadTokens() async {
    try {
      final accessToken = await _storage.read(key: 'access_token');
      final refreshToken = await _storage.read(key: 'refresh_token');
      final expiresAt = await _storage.read(key: 'expires_at');
      final username = await _storage.read(key: 'username');
      if (accessToken == null ||
          refreshToken == null ||
          username == null ||
          expiresAt == null) {
        return AuthNotifierState.empty();
      }
      return AuthNotifierState(
        username: username,
        credential: Credential.expiresAt(
          accessToken: accessToken,
          refreshToken: refreshToken,
          expiresAt: DateTime.fromMicrosecondsSinceEpoch(int.parse(expiresAt)),
        ),
      );
    } on Exception catch (e) {
      if (kDebugMode) print('Error loading tokens: $e');
      return AuthNotifierState.empty();
    }
  }

  Future<void> saveCodeVerifier(String codeVerifier) async {
    await _storage.delete(key: 'code_verifier');
    await _storage.write(key: 'code_verifier', value: codeVerifier);
  }

  Future<void> _checkExpiredToken() async {
    final credential = state.unwrapPrevious().valueOrNull?.credential;
    if (credential == null) {
      return;
    }

    if (DateTime.now().isAfter(credential.expiresAt)) {
      await _refreshAccessToken(credential.refreshToken);
    }
  }

  Future<void> login() async {
    final codeVerifier = _generateCodeChallenge(_generateCodeVerifier());
    await saveCodeVerifier(codeVerifier);
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final credential = await ref
          .read(authRepositoryProvider)
          .launchLoginUrl(codeVerifier: codeVerifier);
      final username = await ref
          .read(malRepositoryProvider)
          .fetchUsername(credential.accessToken);
      await _saveTokens(credential, username);
      return AuthNotifierState(username: username, credential: credential);
    });
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

  Future<T> retry<T>(
    Future<T> Function(String accessToken) function, {
    String? overrideAccessToken,
    String? overrideRefreshToken,
  }) async {
    final refreshToken =
        overrideRefreshToken ?? await _storage.read(key: 'refresh_token');
    if (refreshToken == null) {
      throw StateError('Refresh token not found');
    }

    final accessToken =
        overrideAccessToken ?? await _storage.read(key: 'access_token');
    if (accessToken == null) {
      throw StateError('Access token not found');
    }
    try {
      return await function(accessToken);
    } on MalException catch (e) {
      if (e.response.statusCode == 401 &&
          (e.response.headers['www-authenticate']?.contains('invalid_token') ??
              false)) {
        await _refreshAccessToken(refreshToken);
        final newAccessToken = await _storage.read(key: 'access_token');
        if (newAccessToken == null) {
          throw StateError('Access token not found');
        }
        return await function(newAccessToken);
      }
      rethrow;
    }
  }

  static Future<void> _saveTokens(
    Credential credential,
    String username,
  ) async {
    await _storage.write(key: 'access_token', value: credential.accessToken);
    await _storage.write(key: 'refresh_token', value: credential.refreshToken);
    await _storage.write(
      key: 'expires_at',
      value: credential.expiresAt.millisecondsSinceEpoch.toString(),
    );
    await _storage.write(key: 'username', value: username);
  }

  Future<AuthNotifierState> _refreshAccessToken(String refreshToken) async {
    try {
      final Credential credential = await ref
          .read(authRepositoryProvider)
          .refreshAccessToken(
            refreshToken: refreshToken,
            clientId: Env.clientId,
          );
      final username = await ref
          .read(malRepositoryProvider)
          .fetchUsername(credential.accessToken);
      await _saveTokens(credential, username);
      return AuthNotifierState(username: username, credential: credential);
    } on Exception catch (e) {
      if (kDebugMode) print("refresh token error: $e");
      await logout();
      return AuthNotifierState.empty();
    }
  }

  Future<void> logout() async {
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');
    await _storage.delete(key: 'expires_in');
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
  final String tokenType;
  final String accessToken;
  final String refreshToken;
  final DateTime expiresAt;

  Credential({
    this.tokenType = 'Bearer',
    required this.accessToken,
    required this.refreshToken,
    required int expiresIn,
  }) : expiresAt = DateTime.now().add(Duration(seconds: expiresIn));

  Credential.expiresAt({
    this.tokenType = 'Bearer',
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
  });
}

class AuthNotifierState {
  final Credential? credential;
  final String? username;
  factory AuthNotifierState.empty() =>
      const AuthNotifierState(credential: null);

  const AuthNotifierState({this.credential, this.username});

  bool get isLoggedIn => credential != null;
}
