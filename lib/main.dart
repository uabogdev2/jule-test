import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cercle_mystique/src/routing/app_router.dart';
import 'package:cercle_mystique/src/app/theme/app_theme.dart'; // Import AppTheme
import 'package:cercle_mystique/src/app/theme/theme_controller.dart'; // Import ThemeController

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget { // Change to ConsumerWidget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { // Add WidgetRef
    final themeMode = ref.watch(themeControllerProvider); // Watch the theme controller

    return MaterialApp.router(
      routerConfig: router,
      title: 'Cercle Mystique',
      theme: AppTheme.lightTheme, // Provide light theme
      darkTheme: AppTheme.darkTheme, // Provide dark theme
      themeMode: themeMode, // Set themeMode from the controller
    );
  }
}
