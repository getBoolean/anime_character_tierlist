import 'package:anime_character_tierlist/src/features/auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('AniChar Tierlist'),

            ...authState.when(
              data: (state) {
                final credential = state.credential;
                return credential != null
                    ? [
                      Text('Logged in as: ${state.username}'),
                      ElevatedButton(
                        onPressed: ref.read(authServiceProvider).logout,
                        child: Text('Logout'),
                      ),
                    ]
                    : [];
              },
              error: (err, st) => [Text('Error: $err')],
              loading: () => [CircularProgressIndicator()],
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text('MyAnimeList Login')),
      body: Center(
        child: authState.when(
          data: (state) {
            final credential = state.credential;
            return credential == null
                ? ElevatedButton(
                  onPressed: () async {
                    ref.read(authServiceProvider).login();
                  },
                  child: Text('Login with MyAnimeList'),
                )
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Logged in as: ${state.username}'),
                    ElevatedButton(
                      onPressed: ref.read(authServiceProvider).logout,
                      child: Text('Logout'),
                    ),
                  ],
                );
          },
          error: (err, st) => Text('Error: $err'),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
