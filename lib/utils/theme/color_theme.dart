import 'package:flutter/material.dart';

import 'color_schemes.dart';

final themeLight = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
);

final themedark = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: darkColorScheme.onPrimary
    ),
  ),
);
