import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';

final themeCollection = ThemeCollection(
  themes: {
    0: ThemeData(primarySwatch: Colors.blue),
    1: ThemeData(primarySwatch: Colors.red),
    2: ThemeData.dark(),
  },
  fallbackTheme: ThemeData.light(),
);

class AppThemes {
  static const int LightBlue = 0;
  static const int LightRed = 1;
  static const int DarkBlue = 2;
  static const int DarkRed = 3;

  static String toStr(int themeId) {
    switch (themeId) {
      case LightBlue:
        return "Light Blue";
      case LightRed:
        return "Light Red";
      case DarkBlue:
        return "Dark Blue";
      case DarkRed:
        return "Dark Red";
      default:
        return "Unknown";
    }
  }
}
