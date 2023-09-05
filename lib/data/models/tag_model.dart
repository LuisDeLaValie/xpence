import 'package:hive/hive.dart';

part '../database/g/tag_model.g.dart';

@HiveType(typeId: 4)
class TagModel  {
  @HiveField(0)
  String? id;
  @HiveField(1)
  final String tag;

  TagModel({this.id, required this.tag});
}
