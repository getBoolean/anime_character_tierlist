import 'dart:io' as io;

import 'package:anime_character_tierlist/src/app.dart';
import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main(args) async {
  // used to show a webview title bar. (pkg: desktop_webview_window)
  if (!kIsWeb &&
      (io.Platform.isWindows || io.Platform.isLinux || io.Platform.isMacOS) &&
      runWebViewTitleBarWidget(args)) {
    return;
  }
  WidgetsFlutterBinding.ensureInitialized();
  const useHashUrlStrategy = bool.fromEnvironment(
    'ENABLE_HASH_URL_STRATEGY',
    defaultValue: false,
  );
  if (!useHashUrlStrategy) {
    usePathUrlStrategy();
  }
  runApp(ProviderScope(child: MyApp()));
}
