import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const ACCESS_TOKEN_KEY = 'access-token';
  static const NOTIFICATION_SKIP_KEY = 'notification-skip-key';
  static const THEME_KEY = 'theme-key';
  static SharedPreferences? preferences;

  static void clear() {
    preferences?.clear();
  }

  static void logout() {
    preferences?.remove(ACCESS_TOKEN_KEY);
    preferences?.remove(NOTIFICATION_SKIP_KEY);
  }

  static void storeNotificationSkipped() {
    preferences?.setBool(NOTIFICATION_SKIP_KEY, true);
  }

  static bool get isNotificationSkipped =>
      preferences?.getBool(NOTIFICATION_SKIP_KEY) ?? false;

  static void storeCurrentThemeMode(int value) {
    preferences?.setInt(THEME_KEY, value);
  }

  static ThemeMode get currentThemeMode {
    final int mode = preferences?.getInt(THEME_KEY) ?? 1;
    switch (mode) {
      case 2:
        return ThemeMode.light;
      case 3:
        return ThemeMode.dark;
    }
    return ThemeMode.system;
  }

  //
  // static void storeLocation(List<double> coordinates) {
  //   preferences?.setString(LOCATION_KEY,
  //       json.encode(List<dynamic>.from(coordinates.map((x) => x))));
  // }
  //
  // static List<double> get location =>
  //     preferences?.getString(LOCATION_KEY)?.isEmpty ?? true
  //         ? []
  //         : List<double>.from(
  //                 json.decode(preferences?.getString(LOCATION_KEY) ?? ''))
  //             .map((x) => x)
  //             .toList();

  static void storeAccessToken(String? accessToken) {
    preferences?.setString(ACCESS_TOKEN_KEY, accessToken ?? "");
  }

  static String? get accessToken => preferences?.getString(ACCESS_TOKEN_KEY);
}
