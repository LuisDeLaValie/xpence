import 'package:flutter/material.dart';
import 'package:xpence/screens/login/login_screen.dart';
import 'package:xpence/utils/theme/color_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themedark,
      title: 'Xpence',
      home: const LoginScreen(),
    );
  }
}
