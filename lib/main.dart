import 'package:flutter/material.dart';
import 'package:xpence/utils/theme/color_theme.dart';

import 'data/database/hive_db.dart';
import 'router/router.dart';

Future<void> main() async {
  await strartHive();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late RouterXpence xrouter;

  @override
  void initState() {
    super.initState();
    xrouter = RouterXpence();
    xrouter.start();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: themedark,
      title: 'Xpence',
      routerConfig: xrouter.router,
    );
  }
}
