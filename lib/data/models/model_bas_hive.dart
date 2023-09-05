import 'package:hive/hive.dart';

abstract class ModelBasHive {
  @HiveField(0)
  String? id;
  @HiveField(1)
  DateTime? creado;

  ModelBasHive({this.id, this.creado});
}
