import 'package:anime_character_tierlist/src/auth.dart';
import 'package:anime_character_tierlist/src/router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authProvider);
    final appRouter = ref.watch(appRouterProvider);
    return MaterialApp.router(
      routerConfig: appRouter.config(reevaluateListenable: authNotifier),
      title: 'AniChar Tierlist',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
