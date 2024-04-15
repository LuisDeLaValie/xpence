import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tdtxle_data_format/date_time_extents.dart';
import 'package:tdtxle_data_format/number_extents.dart';
import 'package:xpence/data/database/boxes.dart';

import '../../../data/models/movimiento_model.dart';

class Movimintos extends StatefulWidget {
  const Movimintos({super.key});

  @override
  State<Movimintos> createState() => _MovimintosState();
}

class _MovimintosState extends State<Movimintos> {
  bool inEg = true;

  @override
  Widget build(BuildContext context) {
    final colorOpaco =
        Theme.of(context).colorScheme.onSurface.withOpacity(0.38);

    final textTheme = Theme.of(context).textTheme;
    final textButton =
        textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold);
    final textButtonOpaco = textTheme.labelLarge!
        .copyWith(fontWeight: FontWeight.bold, color: colorOpaco);

    return ValueListenableBuilder<Box<MovimientoModel>>(
      valueListenable: MovimientoBox().box.listenable(),
      builder: (context, box, widget) {
        Iterable<MovimientoModel> movimintos = box.values.toList().reversed;
       
        final fechainicial = DateTime.now().subtract(const Duration(days: 20)).date;
        final fechafinal = DateTime.now();

        movimintos = movimintos.where((element) {
          final tipo = element.tipo == !inEg;
          final rango = element.creado!.between(fechainicial, fechafinal);

          return tipo && rango;
        });

        return Column(
          children: [
            Row(
              children: [
                TextButton(
                    onPressed: () => setState(() => inEg = true),
                    child: Text("Gastos",
                        style: inEg ? textButton : textButtonOpaco)),
                TextButton(
                    onPressed: () => setState(() => inEg = false),
                    child: Text("Ingresos",
                        style: inEg ? textButtonOpaco : textButton)),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    context.goNamed("calendario");
                  },
                  icon: SvgPicture.asset(
                    "assets/icons/canlendario.svg",
                    height: 15,
                    width: 15,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: movimintos.length,
                itemBuilder: (context, index) {
                  final element = movimintos.elementAt(index);
                  final showColor = index % 2 == 0;

                  return Container(
                    decoration: BoxDecoration(
                      color: showColor ? colorOpaco : null,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(element.detalles ?? ""),
                      subtitle: Text(element.creado!.format("D/Mm/y")),
                      trailing: Text(element.monto.toMOney()),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
