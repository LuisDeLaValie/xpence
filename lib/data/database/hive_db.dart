import 'package:hive_flutter/hive_flutter.dart';

import '../models/creditos_model.dart';
import '../models/movimiento_model.dart';
import '../models/suscripciones_model.dart';
import '../models/tag_model.dart';

Future<void> strartHive() async {
  await Hive.initFlutter();
  await openBoxes();
}

Future<void> openBoxes() async {
  await Hive.openBox('configuracion_app');

  Hive.registerAdapter(MovimientoModelAdapter());
  await Hive.openBox<MovimientoModel>("movimnito_box");

  Hive.registerAdapter(CreditosModelAdapter());
  await Hive.openBox<CreditosModel>("creditos_box");

  Hive.registerAdapter(SuscripcionesModelAdapter());
  await Hive.openBox<SuscripcionesModel>("suscripciones_box");

  Hive.registerAdapter(TagModelAdapter());
  await Hive.openBox<TagModel>("tag_box");

}
