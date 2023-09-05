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
  List<TagModel>? tags;
  @HiveField(5)
  bool? tipo;

  MovimientoModel({
    super.id,
    required this.monto,
    this.detalles,
     super.creado,
    this.tags = const [],
    this.tipo = false,
  }) : assert(monto > 0, "el monto no puede ser negativo");
}
