// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:xpence/data/database/boxes.dart';
import 'package:xpence/data/models/movimiento_model.dart';

class PagosPlaneadosProvider with ChangeNotifier {
  double monto = 0;
  String detalles = "";
  int tipo = 0;
  dynamic cuando = "";

  // void init() async {
  //   notifyListeners();
  // }

  Future<void> guardarPago() async {
    final movi = MovimientoBox();
    bool generar = true;

    DateTime fecha = DateTime.now();
    List<MovimientoModel> movimintot = [];

    while (generar) {
      final auxYear = fecha.year;

      movimintot.add(MovimientoModel(
        detalles: detalles,
        tipo: false,
        monto: monto,
        creado: fecha,
      ));

      fecha = DateTime(fecha.year, fecha.month + 1, fecha.day);

      generar = auxYear == fecha.year;
    }
    await movi.inserMany(movimintot);

  }

  @override
  String toString() {
    return 'PagosPlaneadosProvider(monto: $monto, detalles: $detalles, tipo: $tipo, cuando: $cuando)';
  }
}
