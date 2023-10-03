import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

import '../../../data/database/configurasion_app.dart';
import '../../../data/models/movimiento_model.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

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
              if (double.tryParse(value ?? "") == null)
                return "Solo se puede ingresar numeros";

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

      final hoy = DateTime.now();
      final comf = ConfiguracionApp();

      comf.nombreUser = nombre;
      comf.fechaInicio = hoy;

      final movimintoInicial = MovimientoModel(
        monto: montoInicial,
        creado: hoy,
        tipo: true,
      );

      final box = Hive.box<MovimientoModel>("movimnito_box");
      box.add(movimintoInicial);

      context.goNamed("home");
    }
  }
}
