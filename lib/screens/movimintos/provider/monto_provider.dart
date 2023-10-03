import 'package:flutter/material.dart';

class MontoProvider with ChangeNotifier {
  bool _isEgreso = false;
  bool get isEgreso => _isEgreso;
  set isEgreso(bool val) {
    _isEgreso = val;
    notifyListeners();
  }

  void init() async {
    notifyListeners();
  }
}
