import 'package:cercle_mystique/src/app/theme/theme_controller.dart';
import 'package:cercle_mystique/src/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Mock ThemeService for testing
class MockThemeService implements ThemeService {
  ThemeMode _currentThemeMode = ThemeMode.system;

  @override
  Future<ThemeMode> getThemeMode() async {
    return _currentThemeMode;
  }

  @override
  Future<void> setThemeMode(ThemeMode themeMode) async {
    _currentThemeMode = themeMode;
  }
}

void main() {
  // Set up SharedPreferences mock values for ThemeService tests if it were not mocked
  // SharedPreferences.setMockInitialValues({}); will be needed if testing ThemeService directly

  group('ThemeController', () {
    test('initial theme is system and loads correctly', () async {
      final mockThemeService = MockThemeService();
      final controller = ThemeController(mockThemeService);
      // Wait for async loading in constructor
              await Future.delayed(Duration.zero);
              expect(controller.state, ThemeMode.system);
    });

    test('setThemeMode updates the state and persists', () async {
      final mockThemeService = MockThemeService();
      final controller = ThemeController(mockThemeService);
      await Future.delayed(Duration.zero); // for initial load

      await controller.setThemeMode(ThemeMode.dark);
      expect(controller.debugState, ThemeMode.dark);
      expect(await mockThemeService.getThemeMode(), ThemeMode.dark);

      await controller.setThemeMode(ThemeMode.light);
      expect(controller.debugState, ThemeMode.light);
      expect(await mockThemeService.getThemeMode(), ThemeMode.light);
    });

    test('toggleTheme switches between light and dark', () async {
      final mockThemeService = MockThemeService();
      final controller = ThemeController(mockThemeService);
      await Future.delayed(Duration.zero);

      // Assuming initial is light after a set or if system defaults to light for test
      await controller.setThemeMode(ThemeMode.light);
      controller.toggleTheme();
      expect(controller.debugState, ThemeMode.dark);
      expect(await mockThemeService.getThemeMode(), ThemeMode.dark);

      controller.toggleTheme();
      expect(controller.debugState, ThemeMode.light);
      expect(await mockThemeService.getThemeMode(), ThemeMode.light);
    });

    test('setThemeMode does not change state if mode is the same', () async {
      final mockThemeService = MockThemeService();
      final controller = ThemeController(mockThemeService);
      await Future.delayed(Duration.zero);

      await controller.setThemeMode(ThemeMode.dark);
      expect(controller.debugState, ThemeMode.dark);

      // Call again with the same theme
      await controller.setThemeMode(ThemeMode.dark);
      expect(controller.debugState, ThemeMode.dark); // State should remain the same
    });
  });
}
