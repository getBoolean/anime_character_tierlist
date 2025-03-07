import 'package:anime_character_tierlist/src/auth.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'router.gr.dart';

final appRouterProvider = Provider((ref) {
  final authNotifier = ref.watch(authProvider.notifier);
  return AppRouter(authNotifier);
});

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  final AuthNotifier authNotifier;

  AppRouter(this.authNotifier);

  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/login', page: LoginRoute.page, initial: true),
    AutoRoute(path: '/home', page: HomeRoute.page),
  ];

  @override
  List<AutoRouteGuard> get guards {
    return [AuthGuard(authNotifier)];
  }
}

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

@RoutePage()
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authProvider);
    return Scaffold(
      appBar: AppBar(title: Text('MyAnimeList Login')),
      body: Center(
        child: ListenableBuilder(
          listenable: authNotifier,
          builder: (context, _) {
            return authNotifier.state.when(
              data: (state) {
                final credential = state.credential;
                return credential == null
                    ? ElevatedButton(
                      onPressed: () async {
                        authNotifier.login();
                      },
                      child: Text('Login with MyAnimeList'),
                    )
                    : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Logged in as: ${credential.username}'),
                        ElevatedButton(
                          onPressed: authNotifier.logout,
                          child: Text('Logout'),
                        ),
                      ],
                    );
              },
              error: (err, st) => Text('Error: $err'),
              loading: () => CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class AuthGuard extends AutoRouteGuard {
  final AuthNotifier authNotifier;

  const AuthGuard(this.authNotifier);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (authNotifier.isLoggedIn || resolver.routeName == LoginRoute.name) {
      resolver.next();
    } else {
      resolver.redirectUntil(LoginRoute());
    }
  }
}
