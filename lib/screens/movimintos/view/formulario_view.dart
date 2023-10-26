import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tdtxle_data_format/number_extents.dart';
import 'package:tdtxle_inputs_flutter/inputs_tdtxle.dart';
import 'package:xpence/data/models/tag_model.dart';
import 'package:xpence/data/services/notificacion_services.dart';

import '../provider/monto_provider.dart';

class FormularioView extends StatefulWidget {
  const FormularioView({Key? key}) : super(key: key);

  @override
  State<FormularioView> createState() => _FormularioViewState();
}

class _FormularioViewState extends State<FormularioView> {
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
              onSaved: (newValue) => pr.detalles =
                  (newValue ?? "").isEmpty ? "Nuevo movimiento" : newValue!,
            ),
            const SizedBox(height: 10),
            ValueListenableBuilder<Box<TagModel>>(
              valueListenable: Hive.box<TagModel>('tag_box').listenable(),
              builder: (context, box, widget) {
                return ChipFormField<TagModel>(
                  decoration: const InputDecoration(hintText: "Categoria"),
                  onSaved: guardarTagas,
                  onChanged: chaingTag,
                  listaBase: box.values
                      .map((e) => ChipItem<TagModel>(value: e, tex: e.tag))
                      .toList(),
                );
              },
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
                            "se genero un ${pr.isEgreso ? 'ingrego' : 'egreso'} de ${pr.monto.toMOney()}");
                        NotificacionServices.notificacionProgramada(
                            "Moviminto creado",
                            "se genero un ${pr.isEgreso ? 'ingrego' : 'egreso'} de ${pr.monto.toMOney()}");
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

  void guardarTagas(List<ChipItem<TagModel>>? value) async {
    final tags = value?.map((e) => e.value).toList();
    final pr = context.read<MontoProvider>();

    pr.tags = tags?.cast<TagModel>();
  }

  void chaingTag(List<ChipItem<TagModel>>? value) async {
    final box = Hive.box<TagModel>("tag_box");

    var tagsAux1 = value!.map((e) {
      final newTag = TagModel(tag: e.tex);

      if (e.value == null) {
        return ChipItem(value: newTag, tex: e.tex);
      }

      return e;
    });

    var tagsAux2 =
        tagsAux1.where((element) => (element.value?.id == null)).toList();

    var nuevosTags = tagsAux2.map((e) => e.value!);

    if (nuevosTags.isNotEmpty) {
      nuevosTags = nuevosTags
          .map((e) => e..id = "${DateTime.now().millisecondsSinceEpoch}")
          .toList();

     await box.addAll(nuevosTags);
    }
  }
}
