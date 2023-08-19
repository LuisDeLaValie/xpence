import 'package:flutter/material.dart';

import 'color_schemes.dart';

final themeLight = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    scaffoldBackgroundColor: lightColorScheme.primary);

final themedark = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: darkColorScheme.inversePrimary,
  // buttonTheme: ButtonThemeData(buttonColor: ),
);
