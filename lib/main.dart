import 'package:flutter/material.dart';
import 'package:xpence/screens/home/home_screen.dart';
import 'package:xpence/utils/theme/color_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themedark,
      title: 'Xpence',
      home: const HomeScreen(),
    );
  }
}
