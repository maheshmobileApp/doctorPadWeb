import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/entity/patient_entity/add_patients_entity.dart';
import '../repository/patients_repository.dart';

class GetAllPatientsViewModel with ChangeNotifier {
  final _patientsRepository = PatientsRepository();
  Future<void> getAllPatients() async {
    final result = await _patientsRepository .getAllPatients();
  }
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
    final result = await _patientsRepository.addPatient(AddPatientEntity(
    createdBy: createdBy,
    dob: dob,
    emailId: emailId,
    mobileNo: mobileNo,
    name: name,
    referredBy: referredBy  ));
    if (result.isActive == 200)
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:  Text(result.toString() ),
        
      ));
  }

  notifyListeners();
}
