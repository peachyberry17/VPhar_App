import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:start_trial/model/Medicine.dart';

class MedicineNotifier with ChangeNotifier{
  List<Medicine> _medicineList = [];
  Medicine _currentMedicine;

  UnmodifiableListView<Medicine> get medicineList => UnmodifiableListView(_medicineList);

  Medicine get currentMedicine => _currentMedicine;

  set medicineList(List<Medicine> medicineList){
    _medicineList = medicineList;
    notifyListeners();
  }

  set currentMedicine(Medicine medicine){
    _currentMedicine = medicine;
    notifyListeners();
  }
}