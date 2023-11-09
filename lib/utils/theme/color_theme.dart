import 'package:flutter/material.dart';

import 'color_schemes.dart';

final themeLight = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: lightColorScheme.onPrimary),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: const Color(0xFFFFFFFF),
    ),
  ),
  inputDecorationTheme: _impust.copyWith(
    hintStyle: TextStyle(color: const Color(0xFF0A45FA).withOpacity(0.56)),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
    ),
  ),
);

final themedark = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: darkColorScheme.onPrimary),
  ),
  inputDecorationTheme: _impust,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
    ),
  ),
);

const _impust = InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
  ),
);
