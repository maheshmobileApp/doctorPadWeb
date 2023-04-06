import 'package:cgg_base_project/repository/doctor_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/get_all_doctor.dart';

class GetAllDoctorViewModel with ChangeNotifier {
  final _getAllDoctorRepository = AddDoctorRepository();
  GetAllDoctor? doctors;
  bool isLoading = true;

  // GetAllDoctorViewModel() {
  //   getAllDoctor();
  // }

  Future<void> getAllDoctor() async {
    final result = await _getAllDoctorRepository.getAllDoctor();
    doctors = result;
    isLoading = false;
    notifyListeners();
  }
}

////Get Doctor Specialites get method,

class GetDoctorSpecialites with ChangeNotifier {
  // final _getDoctorSpecialitesRepository = GetDoctorSpecialitesRepository();
  // Future<void> getDoctorSpecialitesRepository() async {
  //   final result = await _getDoctorSpecialitesRepository.toString();
  // }
}
