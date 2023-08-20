import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

enum Periodo { week, month, year }

class Graficas extends StatefulWidget {
  final List<SalesData> data;
  final Periodo periodo;
  const Graficas({Key? key, required this.data, required this.periodo})
      : super(key: key);

  @override
  State<Graficas> createState() => _GraficasState();
}

class _GraficasState extends State<Graficas> {
  late TextTheme textTheme;
  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;

    final monto = sumMonto();

    late DateTimeAxis chartTypy;
    late String perido;

    switch (widget.periodo) {
      case Periodo.week:
        chartTypy = chartSemana();
        perido = "esta semana";
      case Periodo.month:
        chartTypy = chartMes();
        perido = "este mes";
      case Periodo.year:
        chartTypy = chartyear();
        perido = "este año";
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "Total de gastos $perido",
            style: textTheme.labelLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "\$${monto.toStringAsFixed(2)}",
            style:
                textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: SfCartesianChart(
            primaryXAxis: chartTypy,
            plotAreaBorderColor: Colors.transparent,
            series: <ChartSeries>[
              AreaSeries<SalesData, DateTime>(
                dataSource: widget.data,
                color: colorTheme.onPrimary,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    colorTheme.onPrimary.withOpacity(0.8),
                    colorTheme.onPrimary.withOpacity(0.4),
                  ],
                  stops: const [0.3, 1],
                ),
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales,
              )
            ],
          ),
        )
      ],
    );
  }

  double sumMonto() {
    double monto = 0.0;

    for (var val in widget.data) {
      monto += val.sales;
    }

    return monto;
  }

  DateTimeAxis chartSemana() {
    final dateNow = DateTime.now();
    final weekday = dateNow.weekday;
    final semana = ["Lun", "Mar", "Mir", "Jue", "Vie", "Sab", "Dom"];

    final max = dateNow.add(Duration(days: weekday - 7));
    final min = dateNow.subtract(Duration(days: weekday));

    return DateTimeAxis(
      maximumLabels: 7,
      maximum: max,
      minimum: min,
      axisLine: const AxisLine(color: Colors.transparent),
      // lines
      axisLabelFormatter: (axisLabelRenderArgs) {
        final auxFecha = DateTime.fromMillisecondsSinceEpoch(
            axisLabelRenderArgs.value as int);
        final auxweekday = auxFecha.weekday;

        return ChartAxisLabel(
          semana[auxweekday - 1],
          textTheme.bodyMedium,
        );
      },
    );
  }

  DateTimeAxis chartMes() {
    final dateNow = DateTime.now();

    final min = DateTime(dateNow.year, dateNow.month);
    final max = DateTime(dateNow.year, dateNow.month + 1)
        .subtract(const Duration(days: 1));

    final semanas = {
      "W1": [],
      "W2": [],
      "W3": [],
      "W4": [],
      "W5": [],
      "W6": []
    };
    DateTime auxdate = min;
    int auxs = 0;
    do {
      final day = auxdate.day;
      final key = semanas.keys.elementAt(auxs);
      semanas[key]!.add(day);
      if (auxdate.weekday == 7) {
        auxs++;
      }
      auxdate = auxdate.add(const Duration(days: 1));
    } while (auxdate.month <= max.month);

    return DateTimeAxis(
      maximumLabels: 6,
      maximum: max,
      minimum: min,
      axisLine: const AxisLine(color: Colors.transparent),
      axisLabelFormatter: (axisLabelRenderArgs) {
        final auxFecha = DateTime.fromMillisecondsSinceEpoch(
            axisLabelRenderArgs.value as int);
        String w = "";

        for (var i = 0; i < semanas.values.length; i++) {
          var key = semanas.keys.elementAt(i);
          var value = auxFecha.day;
          var values = semanas[key];

          if (values!.contains(value)) {
            w = key;
            break;
          }
        }

        return ChartAxisLabel(w, textTheme.bodyMedium);
      },
    );
  }

  DateTimeAxis chartyear() {
    final dateNow = DateTime.now();
    final mes = ["E", "F", "M", "A", "M", "J", "j", "A", "S", "O", "N", "D"];

    final max = DateTime(dateNow.year, 12, 31);
    final min = DateTime(dateNow.year);

    return DateTimeAxis(
      maximumLabels: 12,
      maximum: max,
      minimum: min,
      axisLine: const AxisLine(color: Colors.transparent),
      // lines
      axisLabelFormatter: (axisLabelRenderArgs) {
        final auxFecha = DateTime.fromMillisecondsSinceEpoch(
            axisLabelRenderArgs.value as int);

        return ChartAxisLabel(
          mes[auxFecha.month - 1],
          textTheme.bodyMedium,
        );
      },
    );
  }
}

List<SalesData> generarData1() {
  final Random random = Random();

  final DateTime now = DateTime(2023, 12, 31);

  final List<SalesData> registros = [];

  for (int i = 0; i < 20; i++) {
    final randomDuration = Duration(days: random.nextInt(361));
    final randomDateTime = now.subtract(randomDuration);
    final randomMonto = (random.nextDouble() * 1000).toDouble();

    final registro = SalesData(randomDateTime, randomMonto);
    registros.add(registro);
  }
  registros.sort((a, b) =>
      a.year.millisecondsSinceEpoch.compareTo(b.year.millisecondsSinceEpoch));
  return registros;
}

List<SalesData> generarData2() {
  final Random random = Random();

  final DateTime now = DateTime(2023, 8, 31);

  final List<SalesData> registros = [];

  for (int i = 0; i < 20; i++) {
    final randomDuration = Duration(days: random.nextInt(31));
    final randomDateTime = now.subtract(randomDuration);
    final randomMonto = (random.nextDouble() * 1000).toDouble();

    final registro = SalesData(randomDateTime, randomMonto);
    registros.add(registro);
  }
  registros.sort((a, b) =>
      a.year.millisecondsSinceEpoch.compareTo(b.year.millisecondsSinceEpoch));
  return registros;
}

List<SalesData> generarData3() {
  final Random random = Random();

  final DateTime now = DateTime.now();

  final List<SalesData> registros = [];

  for (int i = 0; i < 20; i++) {
    final randomDuration = Duration(days: random.nextInt(7));
    final randomDateTime = now.subtract(randomDuration);
    final randomMonto = (random.nextDouble() * 1000).toDouble();

    final registro = SalesData(randomDateTime, randomMonto);
    registros.add(registro);
  }
  registros.sort((a, b) =>
      a.year.millisecondsSinceEpoch.compareTo(b.year.millisecondsSinceEpoch));
  return registros;
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
