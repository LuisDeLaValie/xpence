import 'package:flutter/material.dart';

import '../../data/services/notificacion_services.dart';
import 'login_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    NotificacionServices.permisos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: const LoginView(),
        ),
      ),
    );
  }
}
