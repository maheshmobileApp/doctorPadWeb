import 'package:cgg_base_project/repository/doctor_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class GetAllDoctorViewModel with ChangeNotifier {
  final _getAllDoctorRepository = GetAllDoctorRepository();

  Future<void> getAllDoctor() async {
    final result = await _getAllDoctorRepository.toString();
  }
}

////Get Doctor Specialites get method,

class GetDoctorSpecialites with ChangeNotifier {
  final _getDoctorSpecialitesRepository = GetDoctorSpecialitesRepository();
  Future<void> getDoctorSpecialitesRepository() async {
    final result = await _getDoctorSpecialitesRepository.toString();
  }
}
