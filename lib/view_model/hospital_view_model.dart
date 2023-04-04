import 'package:cgg_base_project/repository/hospital_repository.dart';

import 'package:flutter/material.dart';

import '../model/entity/add_hospital_entity.dart';
import '../model/entity/hospital_entity.dart/add_hospital_branch_entity.dart';
import '../model/entity/hospital_entity.dart/add_hospital_speciality_entity.dart';
import '../res/app_colors.dart';

class HospitalSpeViewModel with ChangeNotifier {
  final _hospitalRepository = HospitalRepository();

  Future<void> getAllHospitalSpecialites() async {
    final result = await _hospitalRepository.getAllHospitalSpecialites();
  }

  Future<void> getAllHospitals() async {
    final result = await _hospitalRepository.getAllHospitals();
  }

  Future<void> addDoctor(
      BuildContext context, String specialityName, String createdBy) async {
    final result = await _hospitalRepository.addHospitalSpeciality(
        AddHospitalSpecialityEntity(
            createdBy: createdBy, specialityName: specialityName));
    if (result.status == 200)
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result.message ?? ''),
        backgroundColor: AppColors.app_bg_color,
      ));
  }

  notifyListeners();

  Future<void> addHoapital(
    BuildContext context,
    String? createdBy,
    String? email,
    String? name,
    String? phone,
  ) async {
    final result = await _hospitalRepository.addHospital(AddHospitalEntity(
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
    notifyListeners();
  }

  Future<void> addHospitalBranch(
    BuildContext context,
    String? address,
    String? createdBy,
    String? hospitalId,
    String? name,
    String? prescriptionImageUrl,
    List<SpecializationIds>? specializationIds,
  ) async {
    final result = await _hospitalRepository.addHospitalBranch(
        AddHospitalBranchEntity(
            address: address,
            createdBy: createdBy,
            hospitalId: hospitalId,
            name: name,
            prescriptionImageUrl: prescriptionImageUrl,
            specializationIds: specializationIds));
    if (result.isActive == 200)
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result.toString()),
        backgroundColor: AppColors.app_bg_color,
      ));

    notifyListeners();
  }
}
