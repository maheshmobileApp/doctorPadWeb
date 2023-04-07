import 'package:cgg_base_project/model/entity/add_doctor_specialites_entity';
import 'package:cgg_base_project/res/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../model/entity/add_doctor_entity.dart';
import '../model/entity/doctor_mobile_password_entity.dart';
import '../repository/doctor_repository.dart';
import '../res/constants/routes_constants.dart';

class DoctorViewModel with ChangeNotifier {
  final _addDoctorRepository = AddDoctorRepository();

  Future<void> addDoctor(BuildContext context, String doctorNumber,
      String emailId, String mobileNo, String name, String createdBy) async {
    final result = await _addDoctorRepository.addDoctor(AddDoctorEntity(
      createdBy: createdBy,
      doctorRegistrationNumber: doctorNumber,
      emailId: emailId,
      mobileNo: mobileNo,
      name: name
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

  Future<void> addDoctorSpcialites(
      BuildContext context, String specialityName, String createdBy) async {
    final result = await _addDoctorRepository.addDoctorSpecialites(
        AddDoctorSpecialitesEntity(
            createdBy: createdBy, specialityName: specialityName));
    if (result.status == 200) {
      context.go(RoutesList.addDoctorSuccessfully);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result.message ?? ''),
        backgroundColor: AppColors.app_bg_color,
      ));
    }
    notifyListeners();
  }

  Future<void> getAllDoctor() async {
    final result = await _addDoctorRepository.getAllDoctor();
  }

  Future<void> getDoctorSpecialitesRepository() async {
    final result = await _addDoctorRepository.toString();
  }
}
