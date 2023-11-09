// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import 'model_bas_hive.dart';

part '../database/g/suscripciones_model.g.dart';

@HiveType(typeId: 2)
class SuscripcionesModel extends ModelBasHive {
  @HiveField(2)
  String suscripcion;
  @HiveField(3)
  double pago;
  @HiveField(4)
  int pagoD;
  @HiveField(5)
  bool activa;

  SuscripcionesModel({
     super.id,
     super.creado,
    required this.suscripcion,
    required this.pago,
    required this.pagoD,
    required this.activa,
  })  : assert(pagoD < 31 && pagoD > 1,
            "el dima de pago no puede ser mayor a 31 y menor de 1"),
        assert(pago > 0, "el pago no puede ser un monto negativo");

  // Hive fields go here

  @override
  String toString() {
    return 'SuscripcionesModel(id: $id, creado: $creado, suscripcion: $suscripcion, pago: $pago, pagoD: $pagoD, activa: $activa)';
  }
}
