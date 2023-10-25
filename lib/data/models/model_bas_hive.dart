import 'package:hive/hive.dart';

abstract class ModelBasHive extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  DateTime? creado;

  ModelBasHive({this.id, this.creado});
}
