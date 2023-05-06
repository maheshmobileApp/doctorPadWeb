import 'package:cgg_base_project/repository/doctor_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../model/doctor_model.dart/doctor_specialites.dart';
import '../model/entity/doctor_entity.dart/add_doctor_entity.dart';
import '../model/get_all_doctor.dart';
import '../res/app_colors.dart';
import '../res/constants/routes_constants.dart';

class GetAllDoctorViewModel with ChangeNotifier {
  final _getAllDoctorRepository = AddDoctorRepository();
  GetAllDoctor? doctors;
  bool isLoading = true;

  GetAllDoctorViewModel() {
     getAllDoctor();
    print("called GetAllDoctorViewModel view mode");
  }

  Future<void> getAllDoctor() async {
    final result = await _getAllDoctorRepository.getAllDoctor();
    doctors = result;
    isLoading = false;
    notifyListeners();
  }

  final _addDoctorRepository = AddDoctorRepository();
  Future<void> addDoctor(BuildContext context,
      {String? createdBy,
      String? doctorRegistrationNumber,
      String? emailId,
      String? mobileNo,
      String? name}) async {
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

  // final _doctorSpecialitesRepository = AddDoctorRepository();
  // DoctorSpecialitiesRes? hospitals;
  // bool isLoad = true;

  // Future<void> getAllHospitals() async {
  //   final result = await _doctorSpecialitesRepository.doctorSpecialitiesRes();
  //   hospitals = result;
  //   isLoad = false;
  //   notifyListeners();
  // }
}
