import 'package:flutter/material.dart';

class Cabesera extends StatelessWidget {
  const Cabesera({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bienvenido!",
          style: textTheme.displayMedium,
        ),
        Text(
          "A continuacion ingresa los datos requeridos para comenzar a usar Xpence",
          style: textTheme.bodySmall,
        ),
      ],
    );
  }
}
