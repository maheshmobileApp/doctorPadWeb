import 'package:cgg_base_project/model/hospital_details/get_all_hospital_branches.dart';
import 'package:cgg_base_project/repository/hospital_repository.dart';
import 'package:flutter/cupertino.dart';

class GetAllHospitalSpeViewModel with ChangeNotifier {
  final _getAllHospitalSpecialitesRepository =
      GetAllHospitalSpecialitesRepository();

  Future<void> getAllHospitalSpecialites() async {
    final result = await _getAllHospitalSpecialitesRepository.toString();
  }
}

///Get all Hospitals,

class GetAllHospitalsViewModel with ChangeNotifier {
  final _getAllHospitalsRepository = GetAllHospitalRepository();
  Future<void> getAllHospitals() async {
    final result = await _getAllHospitalsRepository.getAllHospitals();
  }
}

////// Get All Hospital branches


class GetAllHospitalBranchesViewModel with ChangeNotifier {
  final _getAllHospitalBranchesRepository = GetAllHospitalBranchesRepository();
  Future<void> getAllHospitals() async {
    final result = await _getAllHospitalBranchesRepository.getAllHoapitalBranches();
  }
}
