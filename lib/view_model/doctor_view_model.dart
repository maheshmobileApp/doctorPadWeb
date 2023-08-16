import 'package:cgg_base_project/repository/doctor_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../data/bae_api_client.dart';
import '../model/doctor_model.dart/doctor_specialites.dart';
import '../model/entity/doctor_entity.dart/add_doctor_entity.dart';
import '../model/get_all_doctor.dart';
import '../res/constants/api_constants.dart';
import '../utils/alert_dialog.dart';
import '../view/add_hospital_successfully/add_hospital_successfully.dart';
import 'hospitalSpecialityModel.dart';

class GetAllDoctorViewModel with ChangeNotifier {
  final _getAllDoctorRepository = AddDoctorRepository();
  GetAllDoctor? doctors;
  bool isLoading = true;
  bool submitting = false;
  bool isFromAssignDoctor = false;
  bool isFromViewDoctorsByBranch = false;
  GetAllDoctor? doctorsByBranch;
  String selectedBranchID = "";
  List<Specilities>? specilityList = [];
  List<String?> selectedHospitalSpecility = [];
  List<String?> selectedDoctorSpecility = [];
  bool isEditDoctor = true;
  bool isEditPressed = false;
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController _doctorSpecialityController = TextEditingController();
  TextEditingController _clinicSpecialityController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController nameOfTheDoctorController = TextEditingController();
  TextEditingController doctorRegistrationNumberController =
      TextEditingController();
  DcotorsDetails? editDoctorDetails;
  GetAllDoctorViewModel() {
    getAllDoctor();
    print("called GetAllDoctorViewModel view mode");
  }

  setDoctorDetails(DcotorsDetails? doctorData) {
    editDoctorDetails = doctorData;
    mobileNumberController.text = doctorData?.mobileNo ?? "";
    emailIdController.text = doctorData?.emailId ?? "";
    nameOfTheDoctorController.text = doctorData?.name ?? "";
    doctorRegistrationNumberController.text =
        doctorData?.doctorRegistrationNumber ?? "";
    isEditPressed = true;
  }

  setEmptyDetails() {
    mobileNumberController.text = "";
    emailIdController.text = "";
    nameOfTheDoctorController.text = "";
    doctorRegistrationNumberController.text = "";
    isEditPressed = false;
  }

  updateDoctorDetails(DcotorsDetails? doctorData, BuildContext context) async {
    final updatePayload = {
      "doctor_registration_number": doctorRegistrationNumberController.text,
      "email_id": emailIdController.text,
      "id": doctorData?.id ?? "",
      "mobile_no": mobileNumberController.text,
      "name": nameOfTheDoctorController.text
    };
    final url = "${ApiConstants.baseUrl}api/v1/doctors/update_doctors";
    final result = await BaseApiClient().client.put(url, data: updatePayload);
    if (result.statusCode == 200) {
      // //success
      Navigator.of(context).pop();
      showAlertMessage(context, "Doctors updated successfully");
      getAllDoctor();
    } else {
      //fail
    }
    /*
    http://doctopad-a2d-dev.el.r.appspot.com/api/v1/doctors/update_doctors
    {
  "doctor_registration_number": "string",
  "email_id": "string",
  "id": "string",
  "mobile_no": "string",
  "name": "string"
}
     */
  }

  Future<void> getAllDoctor() async {
    final result = await _getAllDoctorRepository.getAllDoctor();
    doctors = result;
    isLoading = false;
    notifyListeners();
  }

  Future<bool> getAllDoctorByBranch(String branchID) async {
    // await getAllDoctor();
    final result = await _getAllDoctorRepository.getAllDoctorByBranch(branchID);
    // for (var doctor in result.body  ?? []) {

    // }
    isFromViewDoctorsByBranch = true;
    isFromAssignDoctor = false;
    doctorsByBranch = result;
    isLoading = false;
    notifyListeners();
    if (result.status == 0 || result.status == 404) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> assignDoctorsToBranch(String doctorId) async {
    var payload = {
      "created_by": "mahesh",
      "doctor_id": doctorId,
      "hospital_branch_id": selectedBranchID,
      "is_active": true
    };
    return await _addDoctorRepository.assignDoctors(payload);
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

  updateDoctor() {}

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
