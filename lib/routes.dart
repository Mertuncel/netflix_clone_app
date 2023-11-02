import 'package:go_router/go_router.dart';
import 'package:netflix_app/screens/pages/home_page.dart';
import 'package:netflix_app/screens/main_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, GoRouterState state) {
        return const MainScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (context, GoRouterState state) {
            return const HomePage();
          },
        ),
      ],
    ),
  ],
);