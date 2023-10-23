import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tdtxle_data_format/number_extents.dart';
import 'package:xpence/data/services/notificacion_services.dart';

import '../provider/monto_provider.dart';

class FormularioView extends StatelessWidget {
  FormularioView({Key? key}) : super(key: key);

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final pr = context.read<MontoProvider>();
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: _key,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Monto",
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "El campo no puede ser vacio";
                }

                if (double.tryParse(value ?? "") == null) {
                  return "Ingrese un dato numerico";
                }

                return null;
              },
              onSaved: (newValue) => pr.monto = double.parse(newValue!),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Descripcion",
              ),
              onSaved: (newValue) =>
                  pr.detalles = newValue ?? "Nuevo movimiento",
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
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: SvgPicture.asset("assets/icons/cancel_button.svg"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        _key.currentState!.save();

                        pr.agregarMoviminto();
                        // mostrarNotificacion();
                        NotificacionServices.mostrarNotificacion(
                          "Moviminto creado",
                          "se genero un ${pr.isEgreso?'ingrego':'egreso'} de ${pr.monto.toMOney()}"
                        );
                        NotificacionServices.notificacionProgramada(
                          "Moviminto creado",
                          "se genero un ${pr.isEgreso?'ingrego':'egreso'} de ${pr.monto.toMOney()}"
                        );
                        context.pop();
                      }
                    },
                    child: const Text("Agregar"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
