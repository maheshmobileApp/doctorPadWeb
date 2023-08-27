import 'package:cgg_base_project/model/reports/reports_model.dart';
import 'package:cgg_base_project/repository/login_repository.dart';
import 'package:flutter/foundation.dart';

class ReportsViewModel with ChangeNotifier {
  LoginRepository _loginRepository = LoginRepository();
  ReportsModel? dashboardReports;
  ReportsViewModel() {
    getReports();
  }

  getReports() async {
    //https://doctopad-a2d-dev.el.r.appspot.com/api/v1/dashboard
    final result = await _loginRepository.getReportsData();
    dashboardReports = result;
    notifyListeners();
  }
}
