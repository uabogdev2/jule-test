import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cercle_mystique/src/features/splash/presentation/splash_screen.dart';
import 'package:cercle_mystique/src/features/home/presentation/home_screen.dart';

// Define route paths
const String splashScreenPath = '/splash';
const String homeScreenPath = '/';

final GoRouter router = GoRouter(
  initialLocation: splashScreenPath, // Start with the splash screen
  routes: <RouteBase>[
    GoRoute(
      path: splashScreenPath,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: homeScreenPath,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
  ],
);
