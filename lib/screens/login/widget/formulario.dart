import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  Formulario({Key? key}) : super(key: key);

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _key = GlobalKey<FormState>();

  String nombre = "";
  double montoInicial = 0.0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Nombre de usuario",
            ),
            validator: (value) {
              if ((value ?? "").isEmpty) return "Ingrese un nombre";
              return null;
            },
            onSaved: (newValue) => nombre = newValue!,
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "Monto inicial",
            ),
            validator: (value) {
              if ((value ?? "").isEmpty) return "Ingrese un monto inicial";
              if (double.tryParse(value ?? "") == null) return "Solo se puede ingresar numeros";
              
              return null;
            },
            onSaved: (newValue) => montoInicial = double.parse(newValue!),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onContinuar,
            child: const Center(
              child: Text("Continuar"),
            ),
          ),
        ],
      ),
    );
  }

  void onContinuar() {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
    }
  }
}
