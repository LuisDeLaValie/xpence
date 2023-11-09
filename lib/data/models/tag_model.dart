// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import 'model_bas_hive.dart';

part '../database/g/tag_model.g.dart';

@HiveType(typeId: 4)
class TagModel extends ModelBasHive {
  @HiveField(2)
  final String tag;

  TagModel({super.id, required this.tag, super.creado});

  @override
  String toString() => 'TagModel(id: $id, creado: $creado, tag: $tag)';
}
