import 'package:anime_character_tierlist/src/features/auth.dart';
import 'package:anime_character_tierlist/src/router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    return MaterialApp(
      title: 'AniChar Tierlist',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: authState.when(
        data:
            (state) =>
                state.isLoggedIn ? const HomeScreen() : const LoginScreen(),
        error: (err, st) => Scaffold(body: Center(child: Text(err.toString()))),
        loading:
            () => Scaffold(
              body: Center(child: const CircularProgressIndicator()),
            ),
      ),
    );
  }
}
