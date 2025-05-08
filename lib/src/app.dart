import 'package:anime_character_tierlist/src/features/auth.dart';
import 'package:anime_character_tierlist/src/router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'AniChar Tierlist',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AppStartupWidget(
        onLoaded:
            (context) => Consumer(
              builder: (context, ref, child) {
                final authState = ref.watch(authNotifierProvider).requireValue;
                return authState.isLoggedIn
                    ? const HomeScreen()
                    : const LoginScreen();
              },
            ),
      ),
    );
  }
}

final appStartupProvider = FutureProvider<void>((ref) async {
  await ref.watch(authNotifierProvider.future);
  ref.onDispose(() {
    ref.invalidate(authNotifierProvider);
  });
});

/// Widget class to manage asynchronous app initialization
class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({super.key, required this.onLoaded});
  final WidgetBuilder onLoaded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2. eagerly initialize appStartupProvider (and all the providers it depends on)
    final appStartupState = ref.watch(appStartupProvider);
    return appStartupState.when(
      // 3. loading state
      loading: () => const AppStartupLoadingWidget(),
      // 4. error state
      error:
          (e, st) => AppStartupErrorWidget(
            message: e.toString(),
            // 5. invalidate the appStartupProvider
            onRetry: () => ref.invalidate(appStartupProvider),
          ),
      // 6. success - now load the main app
      data: (_) => onLoaded(context),
    );
  }
}

/// Widget to show while initialization is in progress
class AppStartupLoadingWidget extends StatelessWidget {
  const AppStartupLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Container(color: Theme.of(context).canvasColor)),
    );
  }
}

/// Widget to show if initialization fails
class AppStartupErrorWidget extends StatelessWidget {
  const AppStartupErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 16),
            ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ),
      ),
    );
  }
}
