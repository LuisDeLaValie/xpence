import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tdtxle_data_format/date_time_extents.dart';
import 'package:tdtxle_data_format/number_extents.dart';
import 'package:xpence/data/models/movimiento_model.dart';

import '../provider/calendario_provider.dart';

class MovimintosView extends StatelessWidget {
  const MovimintosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final colorOpaco =
        Theme.of(context).colorScheme.onSurface.withOpacity(0.38);

    return Selector<CalendarioProvider, DateTime>(
      selector: (p0, p1) => p1.selectDate,
      builder: (context, value, child) {
        return ValueListenableBuilder<Box<MovimientoModel>>(
          valueListenable:
              Hive.box<MovimientoModel>('movimnito_box').listenable(),
          builder: (context, box, widget) {
            final list = box.values.where(
              (element) => element.creado!.between(
                DateTime(value.year, value.month, value.day + 1),
                DateTime(value.year, value.month, value.day),
              ),
            );

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
      },
    );
  }
}
