import 'package:flutter/material.dart';

class DashboardController extends ChangeNotifier {
   bool darkTheme = false;
   darkTheme1({bool? value}) { // Setter
    darkTheme = value??false;
    notifyListeners();
  }
   int? count = 0;
   void setCount() {
     count = (count ?? 0) + 1;
     notifyListeners();
   }
}
