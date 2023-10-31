import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:xpence/data/database/boxes.dart';

import '../../../data/models/movimiento_model.dart';
import 'graficas.dart';
import 'package:tdtxle_data_format/date_time_extents.dart';

class Gatsos extends StatelessWidget {
  const Gatsos({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<MovimientoModel>>(
      valueListenable: MovimientoBox().box.listenable(),
      builder: (context, box, widget) {
        List<SalesData> data = box.values
            .map(
              (e) => SalesData(
                e.creado!,
                (e.tipo ?? false) ? 1 * e.monto : -1 * e.monto,
              ),
            )
            .toList();

        final fechafinal = DateTime.now().add(const Duration(days: 1)).date;

        final semana = data.where(
          (element) => element.year.between(
            fechafinal.subtract(const Duration(days: 7)),
            fechafinal,
          ),
        );
        final mes = data.where(
          (element) => element.year.between(
            DateTime(fechafinal.year, fechafinal.month - 1, fechafinal.day),
            fechafinal,
          ),
        );
        final year = data.where(
          (element) => element.year.between(
            DateTime(fechafinal.year - 1, fechafinal.month, fechafinal.day),
            fechafinal,
          ),
        );

        return CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            viewportFraction: 1,
            aspectRatio: 1,
            initialPage: 0,
          ),
          items: [
            Graficas(data: semana.toList(), periodo: Periodo.week),
            Graficas(data: mes.toList(), periodo: Periodo.month),
            Graficas(data: year.toList(), periodo: Periodo.year),
          ],
        );
      },
    );
  }
}
