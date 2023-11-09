// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import 'model_bas_hive.dart';
import 'tag_model.dart';

part '../database/g/movimiento_model.g.dart';

@HiveType(typeId: 1)
class MovimientoModel extends ModelBasHive {
  @HiveField(2)
  double monto;
  @HiveField(3)
  String? detalles;
  @HiveField(4)
  HiveList<TagModel>? tags;
  @HiveField(5)
  bool? tipo;

  MovimientoModel({
    super.id,
    required this.monto,
    this.detalles,
    super.creado,
    this.tags,
    this.tipo = false,
  }) : assert(monto > 0, "el monto no puede ser negativo");

  @override
  String toString() {
    return 'MovimientoModel(id: $id, creado: $creado, monto: $monto, detalles: $detalles, tags: $tags, tipo: $tipo)';
  }
}
