// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PagosPlaneadosProvider with ChangeNotifier {
  double monto = 0;
  String detalles = "";
  int tipo = 0;
  dynamic cuando = "";

  // void init() async {
  //   notifyListeners();
  // }

  Future<void> guardarPago() async {
    print(this);
  }

  @override
  String toString() {
    return 'PagosPlaneadosProvider(monto: $monto, detalles: $detalles, tipo: $tipo, cuando: $cuando)';
  }
}
