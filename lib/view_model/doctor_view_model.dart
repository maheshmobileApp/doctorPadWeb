import 'package:cgg_base_project/repository/doctor_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/entity/add_doctor_entity.dart';
import '../model/get_all_doctor.dart';
import '../res/app_colors.dart';
import '../res/constants/routes_constants.dart';

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

  final _addDoctorRepository = AddDoctorRepository();
   Future<void> addDoctor(BuildContext context,
     String? createdBy,
     String? doctorRegistrationNumber,
     String? emailId,
     String? mobileNo,
     String? name ) async {
    final result = await _addDoctorRepository.addDoctor(AddDoctorEntity(
      createdBy: createdBy,
      doctorRegistrationNumber: doctorRegistrationNumber,
      emailId: emailId,
      mobileNo: mobileNo,
      name: name,
     
    ));
     if (result.status == 200) {
      context.go(RoutesList.addDoctorSuccessfully);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result.message ?? ''),
        backgroundColor: AppColors.app_bg_color,
      ));
    }
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
