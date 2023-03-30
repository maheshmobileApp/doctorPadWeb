import 'package:cgg_base_project/model/entity/add_hospital_entity.dart';
import 'package:cgg_base_project/model/entity/hospital_entity.dart/add_hospital_branch_entity.dart';
import 'package:cgg_base_project/repository/hospital_repository.dart';
import 'package:cgg_base_project/res/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/entity/hospital_entity.dart/add_hospital_speciality_entity.dart';

class DoctorViewModel with ChangeNotifier {
  final _addHospitalSpecialityRepository = AddHospitalSpecialityRepository();

  Future<void> addDoctor(
      BuildContext context, String specialityName, String createdBy) async {
    final result = await _addHospitalSpecialityRepository.addHospitalSpeciality(
        AddHospitalSpecialityEntity(
            createdBy: createdBy, specialityName: specialityName));
    if (result.status == 200)
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result.message ?? ''),
        backgroundColor: AppColors.app_bg_color,
      ));
  }

  notifyListeners();
}

///add Hospital
class AddaHospitalViewModel with ChangeNotifier {
  final _addHospitalRepository = AddHospitalRepository();
  Future<void> addHoapital(
    BuildContext context,
    String? createdBy,
    String? email,
    String? name,
    String? phone,
  ) async {
    final result = await _addHospitalRepository.addHospital(AddHospitalEntity(
      createdBy: createdBy,
      email: email,
      name: name,
      phone: phone,
    ));
    if (result.status == 200)
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result.message ?? ''),
        backgroundColor: AppColors.app_bg_color,
      ));
  }

  notifyListeners();
}

/////add hospital branchs
class AddHospitalBranchViewModel with ChangeNotifier {
  final _addHospitalBranchRepository = AddHospitalBranchRepository();
  Future<void> addHospitalBranch(
    BuildContext context,
    String? address,
  String? createdBy,
  String? hospitalId,
  String? name,
  String? prescriptionImageUrl,
  List<SpecializationIds>? specializationIds,
  ) async {
    final result = await _addHospitalBranchRepository.addHospitalBranch(AddHospitalBranchEntity(
      address: address,
      createdBy: createdBy,
      hospitalId: hospitalId,
      name: name,
      prescriptionImageUrl: prescriptionImageUrl,
      specializationIds: specializationIds));
    if (result.isActive == 200)
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:  Text(result.toString()),
        backgroundColor: AppColors.app_bg_color,
      ));
  }

  notifyListeners();
}