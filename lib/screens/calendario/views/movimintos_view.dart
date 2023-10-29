import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tdtxle_data_format/date_time_extents.dart';
import 'package:tdtxle_data_format/number_extents.dart';
import 'package:xpence/data/database/boxes.dart';
import 'package:xpence/data/models/movimiento_model.dart';

import '../provider/calendario_provider.dart';

class MovimintosView extends StatelessWidget {
  const MovimintosView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final colorOpaco =
        Theme.of(context).colorScheme.onSurface.withOpacity(0.38);

    return Selector<CalendarioProvider, DateTime>(
      selector: (p0, p1) => p1.selectDate,
      builder: (context, value, child) {
        return ValueListenableBuilder<Box<MovimientoModel>>(
          valueListenable: MovimientoBox().box.listenable(),
          builder: (context, box, widget) {
            final list = box.values
                .where(
                  (element) {
                    final after = value.subtract(const Duration(days: 1)).date;
                    final before = value.add(const Duration(days: 1)).date;
                        
                    final fecha = element.creado!;

                    final res = fecha.between(after, before);

                    return res;
                  },
                )
                .toList()
                .reversed;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    value.format("d Mmm"),
                    style: textTheme.displaySmall,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final element = list.elementAt(index);
                      final monto = (element.tipo ?? false)
                          ? element.monto
                          : element.monto * -1;

                      final showColor = index % 2 == 0;

                      return Container(
                        decoration: BoxDecoration(
                          color: showColor ? colorOpaco : null,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: Text(element.detalles ?? ""),
                          subtitle: Text(element.creado!.format("D/Mm/y")),
                          trailing: Text(monto.toMOney()),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
