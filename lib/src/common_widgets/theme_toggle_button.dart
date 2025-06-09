import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cercle_mystique/src/app/theme/theme_controller.dart';

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);
    final themeController = ref.read(themeControllerProvider.notifier);

    return IconButton(
      icon: Icon(themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode),
      onPressed: () {
        themeController.toggleTheme();
      },
      tooltip: themeMode == ThemeMode.dark ? 'Switch to Light Theme' : 'Switch to Dark Theme',
    );
  }
}
