import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cercle_mystique/src/services/theme_service.dart';

final themeServiceProvider = Provider<ThemeService>((ref) => ThemeService());

final themeControllerProvider = StateNotifierProvider<ThemeController, ThemeMode>((ref) {
  final themeService = ref.watch(themeServiceProvider);
  return ThemeController(themeService);
});

class ThemeController extends StateNotifier<ThemeMode> {
  final ThemeService _themeService;

  ThemeController(this._themeService) : super(ThemeMode.system) {
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    state = await _themeService.getThemeMode();
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    if (state != themeMode) {
      state = themeMode;
      await _themeService.setThemeMode(themeMode);
    }
  }

  void toggleTheme() {
    if (state == ThemeMode.dark) {
      setThemeMode(ThemeMode.light);
    } else {
      setThemeMode(ThemeMode.dark);
    }
  }
}
