import 'package:anime_character_tierlist/src/features/auth.dart';
import 'package:anime_character_tierlist/src/features/character/character_ranking.dart';
import 'package:anime_character_tierlist/src/features/ranking/ranking_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => ref.read(authServiceProvider).logout(),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Center(child: RankingScreen()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => CharacterFormDialog(),
          );
        },
        tooltip: 'Add New Character Ranking',
        child: Icon(Icons.add),
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
