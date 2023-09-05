import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:xpence/data/database/configurasion_app.dart';
import 'package:xpence/data/database/hive_db.dart';

Future<void> main() async {
  // await strartHive();
  Hive.init("./");
  await openBoxes();

  var configura = ConfiguracionApp();

  test('establecer datos iniciales', () {
    expect(configura.nombreUser, "");
    expect(configura.fechaInicio, isA<DateTime>());
    expect(configura.thema, false);
  });

  final no = DateTime.now();
  test('Estableser valores inicales', () {
    configura.nombreUser = "Emilio prueba";
    configura.fechaInicio = no;
    configura.thema = true;
  });

  test('comprobar datos', () {
    var nuevo = ConfiguracionApp();

    expect(configura.nombreUser, nuevo.nombreUser);
    expect(configura.fechaInicio, nuevo.fechaInicio);
    expect(configura.thema, nuevo.thema);
  });
}
