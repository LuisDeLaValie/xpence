import 'dart:developer';

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
    await tag.inserOne(TagModel(tag: "Pagos"));
    await tag.inserOne(TagModel(tag: "comida"));
    id = await mov.inserOne(
      MovimientoModel(
        monto: 129,
        detalles: "Spotify",
        tags: tag.findMany((p0) => true),
        creado: DateTime.now(),
      ),
    );

    expect(id, isA<String>());
  });

  test('findOne', () {
    var movimineto = mov.findOne((p0) => p0.id == id);

    expect(movimineto, isA<MovimientoModel>());
    print(
        " { id:${movimineto?.id}, monto:${movimineto?.monto}, detalles:${movimineto?.detalles} ,:${movimineto?.tags?.length}  }");
  });

  test('findMany', () {
    var movimineto = mov.findMany((p0) => true);

    expect(movimineto, isA<List<MovimientoModel>>());
    expect(movimineto.length, greaterThanOrEqualTo(1));
    print(movimineto.length);
  });
}
