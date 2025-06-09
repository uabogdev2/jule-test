import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _themeModeKey = 'themeMode';

class ThemeService {
  Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeString = prefs.getString(_themeModeKey);
    if (themeModeString == 'dark') {
      return ThemeMode.dark;
    } else if (themeModeString == 'light') {
      return ThemeMode.light;
    }
    return ThemeMode.system; // Default
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeModeKey, themeMode.name);
  }
}
