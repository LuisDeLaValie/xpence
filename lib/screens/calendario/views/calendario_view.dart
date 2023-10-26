import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tdtxle_data_format/date_time_extents.dart';
import 'package:xpence/data/models/movimiento_model.dart';
import 'package:xpence/utils/widget/calendario/calendario.dart';

import '../../../data/database/boxes.dart';
import '../provider/calendario_provider.dart';

class CalendarioView extends StatefulWidget {
  const CalendarioView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CalendarioViewState createState() => _CalendarioViewState();
}

class _CalendarioViewState extends State<CalendarioView> {
  DateTime currentDate = DateTime.now();

  CalendarioStyle calendarioStyle = CalendarioStyle(
    padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 6),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ValueListenableBuilder<Box<MovimientoModel>>(
      valueListenable: MovimientoBox().box.listenable(),
      builder: (context, box, widget) {
        final data = box.values.map((e) => e.creado!.date).toList();
        final dataSD = data.toSet().toList();

        return Calendario(
          firstDate: DateTime(1997),
          lastDate: DateTime(2050),
          onDateChanged: (p0) {
            context.read<CalendarioProvider>().selectDate = p0;
          },
          initialDate: currentDate,
          markedDates: dataSD,
          cellStyle: calendarioStyle.copyWith(
            decoration: BoxDecoration(
              border: Border.all(
                  color: colorScheme.onPrimary, style: BorderStyle.none),
              borderRadius: BorderRadius.circular(8),
            ),
            style: const TextStyle(fontSize: 10),
          ),
          onCellStyle: calendarioStyle.copyWith(
            decoration: BoxDecoration(
              color: colorScheme.onPrimary,
              border: Border.all(color: colorScheme.onPrimary),
              borderRadius: BorderRadius.circular(9),
            ),
            style: TextStyle(fontSize: 10, color: colorScheme.primary),
          ),
          markedcell: calendarioStyle.copyWith(
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.onPrimary, width: 1),
              borderRadius: BorderRadius.circular(9),
            ),
            style: const TextStyle(fontSize: 10),
          ),
        );
      },
    );
  }
}
