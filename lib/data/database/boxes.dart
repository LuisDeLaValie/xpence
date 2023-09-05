import 'package:hive/hive.dart';
import 'package:xpence/data/models/creditos_model.dart';
import 'package:xpence/data/models/suscripciones_model.dart';
import 'package:xpence/data/models/tag_model.dart';

import '../models/model_bas_hive.dart';
import '../models/movimiento_model.dart';

class MovimientoBox extends HiveBox<MovimientoModel> {
  MovimientoBox() : super("movimnito_box");
}

class CreditosBox extends HiveBox<CreditosModel> {
  CreditosBox() : super("creditos_box");
}

class SuscripcionesBox extends HiveBox<SuscripcionesModel> {
  SuscripcionesBox() : super("suscripciones_box");
}

class TagBox extends HiveBox<TagModel> {
  TagBox() : super("tag_box");
}

abstract class HiveBox<T> {
  HiveBox(String name) {
    _box = Hive.box(name);
  }

  late Box<T> _box;
  Box<T> get box => this._box;

  Future<String> inserOne(T value) async {
    final key = DateTime.now().millisecondsSinceEpoch.toString();
    var auxval = value as ModelBasHive;
    auxval.id = key;
    await box.put(key, auxval as T);
    return key;
  }

  T? findOne(bool Function(T) where) {
    try {
      return box.values.firstWhere(where);
    } on StateError {
      return null;
    }
  }

  List<T> findMany(bool Function(T) where) => box.values.where(where).toList();

  Future<String?> updateOne(bool Function(T) where, T value) async {
    try {
      var auxdaa = box.values.firstWhere(where) as ModelBasHive;
      final key = auxdaa.id;

      var auxval = value as ModelBasHive;
      auxval.id = key;

      await box.put(key, auxval as T);
      return key;
    } on StateError {
      return null;
    }
  }

  // void updateMany(bool Function(T) where, T value) {
  //   var keys = box.values
  //       .where(where)
  //       .toList()
  //       .map((e) => (e as ModelBasHive).id)
  //       .toList();

  //   var auxval = value as ModelBasHive;
  //   auxval.id = key;

  //   box.put(key, auxval as T);
  // }
}
