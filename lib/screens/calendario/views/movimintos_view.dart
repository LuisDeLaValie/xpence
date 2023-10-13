import 'package:flutter/material.dart';
import 'package:tdtxle_data_format/date_time_extents.dart';
import 'package:tdtxle_data_format/number_extents.dart';
import 'package:xpence/data/models/movimiento_model.dart';

class MovimintosView extends StatelessWidget {
  const MovimintosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final colorOpaco =
        Theme.of(context).colorScheme.onSurface.withOpacity(0.38);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "asdsda asdasd",
          style: textTheme.displaySmall,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              // final element = movimintos[0];
              final element = MovimientoModel(
                monto: 745,
                detalles: "adasd",
                creado: DateTime.now(),
              );
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
  }
}
