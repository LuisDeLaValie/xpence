import 'package:hive/hive.dart';

import 'model_bas_hive.dart';

part '../database/g/creditos_model.g.dart';

@HiveType(typeId: 3)
class CreditosModel extends ModelBasHive {
  @HiveField(2)
  final String credito;
  @HiveField(3)
  final double pago;
  @HiveField(4)
  final int corteD;
  @HiveField(5)
  final int pagoD;
  @HiveField(6)
  final double monto;

  CreditosModel({
     super.id,
     super.creado,
    required this.credito,
    required this.pago,
    required this.corteD,
    required this.pagoD,
    required this.monto,
  })  : assert(pagoD < 31 && pagoD > 1,
            "el dima de pago no puede ser mayor a 31 y menor de 1"),
        assert(pago > 0, "el pago no puede ser un monto negativo");
}
