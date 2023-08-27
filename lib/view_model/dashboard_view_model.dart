import 'package:flutter/material.dart';

class DashBoardViewModel extends ChangeNotifier {
  DashBoardMenuOptions selectedMenum = DashBoardMenuOptions.REPORTS;
  DashBoardViewModel() {
    print("called dashboadrd view mode");
  }
  selectTheSideMenu(DashBoardMenuOptions menuOptions) {
    selectedMenum = menuOptions;
    notifyListeners();
  }
}

enum DashBoardMenuOptions { REPORTS,HOSPITALS, DOCTORS, DOCTORSPECALITIES,hOSPITALSPECALITIES,LOGOUT }
