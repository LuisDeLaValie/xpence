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
    tag.inserOne(TagModel(tag: "Pagos"));
    tag.inserOne(TagModel(tag: "comida"));

    final tags = HiveList<TagModel>(tag.box, objects: tag.box.values.toList());

    id = await mov.inserOne(
      MovimientoModel(
        monto: 129,
        detalles: "Spotify",
        tags: tags,
        creado: DateTime.now(),
      ),
    );

    expect(id, isA<String>());
  });

  test('findOne', () {
    var movimineto = mov.findOne((p0) => p0.id == id);

    expect(movimineto, isA<MovimientoModel>());
    log(" { id:${movimineto?.id}, monto:${movimineto?.monto}, detalles:${movimineto?.detalles} ,:${movimineto?.tags?.length}  }");
  });

  test('findMany', () {
    var movimineto = mov.findMany((p0) => true);

    expect(movimineto, isA<List<MovimientoModel>>());
    expect(movimineto.length, greaterThanOrEqualTo(1));
    log(movimineto.length.toString());
  });
}
