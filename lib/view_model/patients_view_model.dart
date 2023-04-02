import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/entity/patient_entity/add_patients_entity.dart';
import '../repository/patients_repository.dart';

class GetAllPatientsViewModel with ChangeNotifier {
  final _getAllPatientsRepository = GetAllPatientsRepository();
  Future<void> getAllPatients() async {
    final result = await _getAllPatientsRepository .getAllPatients();
  }
}
//////// Add patients /post
class AddPatientViewModel with ChangeNotifier {
  final _addPatientRepository = AddPatientRepository();
  Future<void> addHospitalBranch(
    BuildContext context,
    String? aadhar,
  String? createdBy,
  String? dob,
  String? emailId,
  String? mobileNo,
  String? name,
  String? referredBy,
  ) async {
    final result = await _addPatientRepository.addPatient(AddPatientEntity(
    createdBy: createdBy,
    dob: dob,
    emailId: emailId,
    mobileNo: mobileNo,
    name: name,
    referredBy: referredBy  ));
    if (result.isActive == 200)
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:  Text(result.toString() ?? ''),
        
      ));
  }

  notifyListeners();
}