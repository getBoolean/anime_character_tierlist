import 'package:anime_character_tierlist/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
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
