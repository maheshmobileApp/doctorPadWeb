import 'package:cgg_base_project/res/constants/api_constants.dart';

import '../data/bae_api_client.dart';
import '../model/hospital_details/branches_list_model.dart';
import '../model/hospital_details/get_all_hospital.dart';
import '../model/upload_file.dart/upload_file_model.dart';
import '../utils/alert_dialog.dart';
import 'dashboard_view_model.dart';
import 'hospitalSpecialityModel.dart';
import 'package:flutter/material.dart';

import '../model/entity/hospital_entity.dart/add_hospital_entity.dart';

import '../repository/hospital_repository.dart';
import '../view/add_hospital_successfully/add_hospital_successfully.dart';
import 'package:dio/dio.dart';
import 'package:image_picker_web/image_picker_web.dart';

class GetAllHospitalViewModel with ChangeNotifier {
  final _getAllHospitalRepository = HospitalRepository();
  GetAllHospitals? hospitals;
  bool isLoading = true;
  List<Specilities>? doctorspecilityList = [];
  List<Specilities>? hospitalspecilityList = [];

  // HospitalSpecialitiesModel? specialities;
  List<String?> selectedSpecility = [];
  List<BrachDetailsModel?> bracnhesList = [];

  MediaInfo? selectedImage;
  HospitalResponseModel? selectedHospital;
  bool submitting = false;
  String specilityError = "";
  bool isShowError = false;
  DashBoardMenuOptions selectedSpecilty =
      DashBoardMenuOptions.hOSPITALSPECALITIES;

  GetAllHospitalViewModel() {
    getAllHospitals();
    getSpecilitiesList();
  }
  Future<void> getAllHospitals() async {
    final result = await _getAllHospitalRepository.getAllHospitals();
    hospitals = result;
    isLoading = false;
    notifyListeners();
  }

  updateTheImage(MediaInfo? file) {
    selectedImage = file;
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
    submitting = true;
    notifyListeners();
    final result = await _addHospitalRepository.addHospital(AddHospitalEntity(
      createdBy: createdBy,
      email: email,
      name: name,
      phone: phone,
    ));
    submitting = false;
    Navigator.pop(context);
    if (result.status == 200) {
      showSuccessMessage(context, 'Added Hospital Successfully');
    } else {
      showSuccessMessage(context, 'Faild to add Hospital');
    }
  }

  showSuccessMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
            content: SizedBox(
                width: 300,
                height: 250,
                child: SuccessflullyAlert(
                  title: message,
                  onPressed: () {
                    Navigator.pop(context);
                    getAllHospitals();
                  },
                )));
      },
    );
  }

  void getSpecilitiesList() async {
    //https://doctopad-a2d-dev.el.r.appspot.com/api/v1/hospital_specialities
    final requestUrl =
        selectedSpecilty == DashBoardMenuOptions.hOSPITALSPECALITIES
            ? "${ApiConstants.baseUrl}api/v1/hospital_specialities"
            : "${ApiConstants.baseUrl}api/v1/doctor_specialities";
    final dio = Dio();
    final result = await dio.get(requestUrl);
    final hosptialModel = HospitalSpecialitiesModel.fromJson(result.data);
    if (selectedSpecilty == DashBoardMenuOptions.hOSPITALSPECALITIES) {
      hospitalspecilityList = hosptialModel.specilityList;
    } else {
      doctorspecilityList = hosptialModel.specilityList;
    }
    //specialities = hosptialModel;
    notifyListeners();
  }

  addSpecility(String name, BuildContext context) async {
    final body = {"created_by": "mahesh", "speciality_name": name};
    // final dio = Dio();
    final requestUrl =
        selectedSpecilty == DashBoardMenuOptions.hOSPITALSPECALITIES
            ? "${ApiConstants.baseUrl}api/v1/hospital_specialities"
            : "${ApiConstants.baseUrl}api/v1/doctor_specialities";
    final result = await BaseApiClient().client.post(requestUrl, data: body);
    if (result.statusCode == 200) {
      //success
      Navigator.of(context).pop();
      showAlertMessage(context, "Specilities added successfully");
      getSpecilitiesList();
    } else {
      //fail
    }
  }

  addBranch(
      {String? branName, BuildContext? context, String? branchAddress}) async {
    final fileName = selectedImage?.fileName ?? "";
    if (this.selectedSpecility.isEmpty) {
      showAlertMessage(context!, "Please Select Specility");
      return;
    } else if (fileName.isEmpty) {
      showAlertMessage(context!, "Please Select Prescription ");
      return;
    }
    this.isShowError = false;
    final specilityId = this.selectedSpecility.map((e) => {"id": e}).toList();
    final prescription_image_url = await uploadPrescription();
    final payload = {
      "address": branchAddress,
      "created_by": "string",
      "hospital_id": selectedHospital?.id ?? "",
      "hospital_reg_number": "534233",
      "name": branName,
      "prescription_image_url": prescription_image_url,
      "specialization_ids": specilityId
    };

    notifyListeners();
    //api/v1/hospitals_branch
    try {
      final response = await BaseApiClient()
          .client
          .post("api/v1/hospitals_branch", data: payload);
      print(response.data);
      Navigator.pop(context!);
      showAlertMessage(context!, "Branch Added Successfully!");
    } catch (e) {
      showAlertMessage(context!, "Something wenk wrong!");
    }
  }

  Future<String> uploadPrescription() async {
    //https://doctopad-a2d-dev.el.r.appspot.com/api/v1/file_upload
//https://doctopad-a2d-dev.el.r.appspot.com/
    final fileName = selectedImage?.fileName;
//file.path.split('/').last;
    FormData data = FormData.fromMap({
      "file": await MultipartFile.fromBytes(
        selectedImage!.data!,
        filename: fileName,
      ),
    });
    try {
      final response =
          await BaseApiClient().client.post("api/v1/file_upload", data: data);
      if (response.statusCode == 200) {
        print("response ${response.data}");
        final result = UploadFileResponse.fromJson(response.data);

        final basePath = result.mediaBasePath ?? "";
        final imagePath = result.body?.pathname ?? "";
        return basePath + imagePath;
      } else {
        return "";
      }
    } catch (e) {
      print("error $e");
      return "";
    }
  }

  Future<bool> getBranchesByHospitalsId(String hospitalId) async {
    final result =
        await _getAllHospitalRepository.getBranchesByHospitalsId(hospitalId);
    if (result.status == 404) {
      bracnhesList = [];
      notifyListeners();
      return false;
    } else if (result.status == 404) {
      return false;
    } else {
      bracnhesList = result.body!;
      if (bracnhesList.isEmpty) {
        return false;
      }
      notifyListeners();
      if (bracnhesList.length == 0) {
        return false;
      }
      return true;
    }
  }
}



/*

https://doctopad-a2d-dev.el.r.appspot.com/api/v1/hospital_specialities
POST
BODY

{
  "created_by": "string",
  "speciality_name": "string"
}



 */