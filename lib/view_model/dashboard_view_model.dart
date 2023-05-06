import 'package:flutter/material.dart';

class DashBoardViewModel extends ChangeNotifier {
  DashBoardMenuOptions selectedMenum = DashBoardMenuOptions.HOSPITALS;
  DashBoardViewModel() {
    print("called dashboadrd view mode");
  }
  selectTheSideMenu(DashBoardMenuOptions menuOptions) {
    selectedMenum = menuOptions;
    notifyListeners();
  }
}

enum DashBoardMenuOptions { HOSPITALS, DOCTORS, SPECALITIES }
