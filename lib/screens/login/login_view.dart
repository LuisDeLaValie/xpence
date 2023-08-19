import 'package:flutter/material.dart';

import 'widget/cabesera.dart';
import 'widget/food.dart';
import 'widget/formulario.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: SizedBox(
        height:MediaQuery.of(context).size.height-40,
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Cabesera(),
            const SizedBox(height: 50),
            Formulario(),
            const Spacer(),
            const Food(),
          ],
        ),
      ),
    );
  }
}
