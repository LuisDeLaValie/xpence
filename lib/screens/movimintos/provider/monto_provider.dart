import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:xpence/data/models/movimiento_model.dart';

class MontoProvider with ChangeNotifier {
  bool _isEgreso = false;
  bool get isEgreso => _isEgreso;
  set isEgreso(bool val) {
    _isEgreso = val;
    notifyListeners();
  }

  double monto=0;
  String detalles="";

  void init() async {
    notifyListeners();
  }


  void agregarMoviminto(){
      final hoy = DateTime.now();


      final movimintoInicial = MovimientoModel(
        detalles: detalles,
        monto: monto,
        creado: hoy,
        tipo: _isEgreso,
      );

      final box = Hive.box<MovimientoModel>("movimnito_box");
      box.add(movimintoInicial);

  }
}
