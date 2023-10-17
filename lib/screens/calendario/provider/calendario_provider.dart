import 'package:flutter/material.dart';

class CalendarioProvider with ChangeNotifier {
 
  DateTime _selectDate=DateTime.now();
  DateTime get selectDate => _selectDate;
  set selectDate(DateTime val) {
    _selectDate = val;
    notifyListeners();
  }

  void init() async {
    notifyListeners();
  }
}
