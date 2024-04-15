import 'dart:developer' as d;
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:xpence/data/database/boxes.dart';
import 'package:xpence/data/database/hive_db.dart';
import 'package:xpence/data/models/movimiento_model.dart';
import 'package:xpence/data/models/tag_model.dart';

Future<void> main() async {
  Hive.init("./test/database/lock");
  await openBoxes();

  final mov = MovimientoBox();
  final tag = TagBox();
  String? id;
  test('insert', () async {
    final random = Random();

    for (var i = 0; i < 1000; i++) {
      // Guardar Tagas de los Moviminetos
      tag.inserOne(TagModel(tag: generarTagAleatorio()));
      final tags =
          HiveList<TagModel>(tag.box, objects: tag.box.values.toList());

      id = await mov.inserOne(
        MovimientoModel(
          monto: random.nextInt(5000) + 1,
          detalles: generarNombreAleatorio(),
          tags: tags,
          creado: DateTime.now(),
        ),
      );

      expect(id, isA<String>());
    }
  });

  test('findOne', () {
    var movimineto = mov.findOne((p0) => p0.id == id);

    expect(movimineto, isA<MovimientoModel>());
    d.log(
        " { id:${movimineto?.id}, monto:${movimineto?.monto}, detalles:${movimineto?.detalles} ,:${movimineto?.tags?.length}  }");
  });

  test('findMany', () {
    var movimineto = mov.findMany((p0) => true);

    expect(movimineto, isA<List<MovimientoModel>>());
    expect(movimineto.length, greaterThanOrEqualTo(1));
    d.log(movimineto.length.toString());
  });
}

String generarNombreAleatorio() {
  List<String> nombres = [
    'Pagos de servicios públicos',
    'transporte público',
    'Comestibles y productos de despensa',
    'Comidas fuera de casa',
    'Meriendas y alimentos no esenciales',
    'Suscripciones a servicios de transmisión',
    'Cuotas de tarjetas de crédito'
  ];

  final random = Random();
  return nombres[random.nextInt(nombres.length)];
}

String generarTagAleatorio() {
  List<String> nombres = [
    'Pagos de servicios públicos',
    'transporte público',
    'Comestibles y productos de despensa',
    'Comidas fuera de casa',
    'Meriendas y alimentos no esenciales',
    'Suscripciones a servicios de transmisión',
    'Cuotas de tarjetas de crédito'
  ];

  final random = Random();
  return nombres[random.nextInt(nombres.length)];
}
