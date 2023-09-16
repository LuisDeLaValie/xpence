import 'package:hive/hive.dart';

/// | tipo     |      dato      |  detalle |
/// |:---------|:---------------|:---------|
/// |  String  | nombreUser     |          |
/// |  DateTime| fechaInicio    |          |
/// |  bool    | thema          |
///
class ConfiguracionApp {
  late Box<dynamic> _box;
  ConfiguracionApp() {
    _box = Hive.box<dynamic>('configuracion_app');
  }

  String get nombreUser => _box.get('nombre_user', defaultValue: "");
  set nombreUser(String val) {
    _box.put('nombre_user', val);
  }

  DateTime? get fechaInicio => _box.get('fecha_inicio');
  set fechaInicio(DateTime? val) {
    _box.put('fecha_inicio', val);
  }

  bool get thema => _box.get('thema', defaultValue: false);
  set thema(bool val) {
    _box.put('thema', val);
  }
}
