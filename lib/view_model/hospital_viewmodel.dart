import 'package:cgg_base_project/model/hospital_details/get_all_hospital.dart';
import 'package:cgg_base_project/model/hospital_details/hospitail_specialites.dart';
import 'package:cgg_base_project/view/hospital_speciatiles.dart/hospital_specialites.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/entity/hospital_entity.dart/add_hospital_entity.dart';

import '../repository/hospital_repository.dart';
import '../res/app_colors.dart';
import '../res/constants/routes_constants.dart';
import '../view/hospital_speciatiles.dart/hospital_specialites.dart';
import '../view/hospital_speciatiles.dart/hospital_specialites.dart';
import '../view/hospital_speciatiles.dart/hospital_specialites.dart';

class GetAllHospitalViewModel with ChangeNotifier {
  final _getAllHospitalRepository = HospitalRepository();
  GetAllHospitals? hospitals;
  bool isLoading = false;

  List<String> specilitiesList = [];

  GetAllHospitalViewModel() {
    getAllHospitals();
  }
  Future<void> getAllHospitals() async {
    final result = await _getAllHospitalRepository.getAllHospitals();
    hospitals = result;
    isLoading = false;
    notifyListeners();
  }

  final _addHospitalRepository = HospitalRepository();
  // AddHospital? addHospital;

  Future<void> addHospital(
    BuildContext context, {
    String? createdBy,
    String? email,
    String? name,
    String? phone,
  }) async {
    final result = await _addHospitalRepository.addHospital(AddHospitalEntity(
      createdBy: createdBy,
      email: email,
      name: name,
      phone: phone,
    ));
    if (result.status == 200) {
      context.go(RoutesList.addHospitalSuccessfully);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result.message ?? ''),
        backgroundColor: AppColors.app_bg_color,
      ));
    }
    notifyListeners();
    // }
    // final _hospitalSpecialitiesRepository = HospitalRepository();
    // HospitalSpecialities? specialities;
    // bool isLoadin = true;
    // Future<void> HospitalSpecialities (int specialities) async {
    //   final result = await _getAllHospitalRepository.hospitalSpecialities();
    //   specialities = result as int;
    //   isLoading = false;
    //   notifyListeners();
    // }
  }

  void getSpecilitiesList() {
    specilitiesList = ["1", "2", "3"];
    notifyListeners();
  }
}
