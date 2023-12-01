import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:xpence/data/database/boxes.dart';
import 'package:xpence/data/models/movimiento_model.dart';
import 'package:xpence/data/models/tag_model.dart';

class MontoProvider with ChangeNotifier {
  bool _isEgreso = false;
  bool get isEgreso => _isEgreso;
  set isEgreso(bool val) {
    _isEgreso = val;
    notifyListeners();
  }

  double monto = 0;
  String detalles = "";
  List<TagModel>? tags;

  void init() async {
    notifyListeners();
  }

  void agregarMoviminto() {
    final hoy = DateTime.now();

    HiveList<TagModel>? tags;
    // if ((this.tags ?? []).isNotEmpty) {
    //   final boxtag = Hive.box<TagModel>("tag_box");
    //   tags = HiveList<TagModel>(boxtag, objects: this.tags!);
    // }

    final movimintoInicial = MovimientoModel(
      id: hoy.millisecondsSinceEpoch.toString(),
      detalles: detalles,
      monto: monto,
      creado: hoy,
      tipo: _isEgreso,
      tags: tags,
    );

    final box = MovimientoBox();
    box.inserOne(movimintoInicial);
  }
}
