import 'package:cgg_base_project/repository/doctor_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../model/doctor_model.dart/doctor_specialites.dart';
import '../model/entity/doctor_entity.dart/add_doctor_entity.dart';
import '../model/get_all_doctor.dart';
import '../view/add_hospital_successfully/add_hospital_successfully.dart';

class GetAllDoctorViewModel with ChangeNotifier {
  final _getAllDoctorRepository = AddDoctorRepository();
  GetAllDoctor? doctors;
  bool isLoading = true;
  bool submitting = false;
  bool isFromAssignDoctor = false;

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

  Future<bool> getAllDoctorByBranch(String branchID) async {
    final result = await _getAllDoctorRepository.getAllDoctorByBranch(branchID);
    doctors = result;
    isLoading = false;
    notifyListeners();
    if (result.status == 0) {
      return false;
    } else {
      return true;
    }
  }

  final _addDoctorRepository = AddDoctorRepository();
  Future<void> addDoctor(BuildContext context,
      {String? createdBy,
      String? doctorRegistrationNumber,
      String? emailId,
      String? mobileNo,
      String? name}) async {
    submitting = true;
    notifyListeners();
    final result = await _addDoctorRepository.addDoctor(AddDoctorEntity(
      createdBy: createdBy,
      doctorRegistrationNumber: doctorRegistrationNumber,
      emailId: emailId,
      mobileNo: mobileNo,
      name: name,
    ));
    submitting = false;
    notifyListeners();
    Navigator.pop(context);
    if (result.status == 200) {
      showSuccessMessage(context);
    }
    // notifyListeners();
  }

  showSuccessMessage(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
            content: SizedBox(
                width: 300,
                height: 250,
                child: SuccessflullyAlert(
                  title: 'Added Doctor Successfully',
                  onPressed: () {
                    Navigator.pop(context);
                    getAllDoctor();
                  },
                )));
      },
    );
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
