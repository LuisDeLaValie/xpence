import 'package:flutter/material.dart';

import 'widget/cabesera.dart';
import 'widget/food.dart';
import 'widget/formulario.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: SizedBox(
        height:MediaQuery.of(context).size.height-40,
        child: const Column(
          children: [
            SizedBox(height: 80),
            Cabesera(),
            SizedBox(height: 50),
            Formulario(),
            Spacer(),
            Food(),
          ],
        ),
      ),
    );
  }
}
