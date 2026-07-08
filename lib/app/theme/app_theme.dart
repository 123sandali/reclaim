import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: kPrimary,
      brightness: Brightness.light,
    ).copyWith(primary: kPrimary, error: kError, surface: kSurface);

    return ThemeData.from(
      colorScheme: colorScheme,
      useMaterial3: true,
    ).copyWith(
      scaffoldBackgroundColor: kSurface,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
        backgroundColor: kSurface,
        foregroundColor: kPrimary,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: kPrimary,
        foregroundColor: Colors.white,
      ),
    );
  }

  static ThemeData get dark {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: kPrimary,
      brightness: Brightness.dark,
    ).copyWith(primary: kFoundTeal, error: kError, surface: kDarkSurface);

    return ThemeData.from(
      colorScheme: colorScheme,
      useMaterial3: true,
    ).copyWith(scaffoldBackgroundColor: kDarkSurface);
  }
}
