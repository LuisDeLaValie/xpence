import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/models/movimiento_model.dart';
import 'graficas.dart';
import 'package:tdtxle_data_format/date_time_extents.dart';

class Gatsos extends StatelessWidget {
  const Gatsos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<MovimientoModel>>(
      valueListenable: Hive.box<MovimientoModel>('movimnito_box').listenable(),
      builder: (context, box, widget) {
        final hoy = DateTime.now();
        List<SalesData> data = box.values
            .map((e) => SalesData(
                e.creado!, (e.tipo ?? false) ? 1 * e.monto : -1 * e.monto))
            .toList();

        final semana = data.where(
          (element) =>
              element.year.between(hoy, hoy.subtract(const Duration(days: 7))),
        );
        final mes = data.where(
          (element) => element.year
              .between(hoy, DateTime(hoy.year, hoy.month - 1, hoy.day)),
        );
        final year = data.where(
          (element) => element.year
              .between(hoy, DateTime(hoy.year - 1, hoy.month, hoy.day)),
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
