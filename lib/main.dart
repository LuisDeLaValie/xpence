import 'package:flutter/material.dart';
import 'package:xpence/utils/theme/color_theme.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'data/database/hive_db.dart';
import 'data/services/notificacion_services.dart';
import 'router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  tz.initializeTimeZones();

  await strartHive();
  await NotificacionServices.initNotifications();

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
       supportedLocales: const [
        Locale('en', 'US'),  // code
        Locale('es', 'Mx'), // arabic, no country code
      ],
      routerConfig: xrouter.router,
    );
  }
}
