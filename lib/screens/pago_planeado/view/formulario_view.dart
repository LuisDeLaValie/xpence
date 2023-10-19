import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class FormularioView extends StatelessWidget {
  const FormularioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: "Monto",
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(
            hintText: "Descripcion",
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(
            hintText: "Repetir cada x dias",
          ),
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: SvgPicture.asset("assets/icons/cancel_button.svg"),
            ),
            const SizedBox(width: 10),
            ElevatedButton(onPressed: () {}, child: const Text("Agregar"))
          ],
        )
      ],
    );
  }
}
