import 'package:flutter/material.dart';

class FormularioView extends StatelessWidget {
  const FormularioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        child: Column(
          children: [
            TextFormField(
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
                hintText: "Categoria",
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.smart_button)),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: (){}, child: const Text("Agregar"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
