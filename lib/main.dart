import 'dart:async';

import 'package:anime_character_tierlist/src/app.dart';
import 'package:anime_character_tierlist/src/auth.dart';
import 'package:anime_character_tierlist/src/router.dart';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authNotifier = AuthNotifier();
  final appRouter = AppRouter(authNotifier);
  await _initAppLinks(appRouter, authNotifier);

  runApp(
    ProviderScope(
      overrides: [
        appRouterProvider.overrideWith((ref) {
          return appRouter;
        }),
      ],
      child: MyApp(),
    ),
  );
}

Future<void> _initAppLinks(
  AppRouter appRouter,
  AuthNotifier authNotifier,
) async {
  final appLinks = AppLinks();

  // Check initial link
  final appLink = await appLinks.getInitialLink();
  if (appLink != null) {
    _handleUrl(appLink, appRouter, authNotifier);
  }

  // Listen to future links
  appLinks.uriLinkStream.listen((uri) {
    _handleUrl(uri, appRouter, authNotifier);
  });
}

void _handleUrl(Uri uri, AppRouter appRouter, AuthNotifier authNotifier) {
  if (uri.scheme == 'dev.getboolean.anime-character-tierlist' &&
      uri.host == 'oauth2redirect') {
    final code = uri.queryParameters['code'];
    if (code != null) {
      authNotifier.exchangeCodeForToken(code);
      appRouter.pushAndPopUntil(HomeRoute(), predicate: (route) => false);
    }
  }
}
