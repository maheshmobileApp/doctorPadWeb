import 'package:cgg_base_project/model/hospital_details/get_all_hospital.dart';
import 'package:flutter/material.dart';

import '../repository/hospital_repository.dart';

class GetAllHospitalViewModel with ChangeNotifier {
  final _getAllHospitalRepository = HospitalRepository();
  GetAllHospitals? hospitals;
  bool isLoading = true;

  Future<void> getAllHospitals() async {
    final result = await _getAllHospitalRepository.getAllHospitals();
    hospitals = result;
     isLoading = false;
    notifyListeners();
  }
}
