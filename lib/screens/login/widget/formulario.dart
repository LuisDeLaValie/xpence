import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xpence/data/database/boxes.dart';

import '../../../data/database/configurasion_app.dart';
import '../../../data/models/movimiento_model.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

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
            key: Key("Nombre Usuario",),
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
            key: Key("monto inicial",),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "Monto inicial",
            ),
            validator: (value) {
              if ((value ?? "").isEmpty) return "Ingrese un monto inicial";
              if (double.tryParse(value ?? "") == null) {
                return "Solo se puede ingresar numeros";
              }

              return null;
            },
            onSaved: (newValue) => montoInicial = double.parse(newValue!),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            key: Key("btn_continuar"),
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
        detalles: "Inico ",
        monto: montoInicial,
        tipo: true,
      );

      final box = MovimientoBox();
      box.inserOne(movimintoInicial);

      context.goNamed("intro");
    }
  }
}
