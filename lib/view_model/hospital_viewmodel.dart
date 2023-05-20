import 'package:cgg_base_project/data/bae_api_client.dart';
import 'package:cgg_base_project/model/hospital_details/branches_list_model.dart';
import 'package:cgg_base_project/model/hospital_details/get_all_hospital.dart';
import 'package:cgg_base_project/model/hospital_details/hospitail_specialites.dart';
import 'package:cgg_base_project/model/upload_file.dart/upload_file_model.dart';
import 'package:cgg_base_project/view/hospital_speciatiles.dart/hospital_specialites.dart';
import 'package:cgg_base_project/view_model/hospitalSpecialityModel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/entity/hospital_entity.dart/add_hospital_entity.dart';

import '../repository/hospital_repository.dart';
import '../res/app_colors.dart';
import '../res/constants/routes_constants.dart';
import '../view/add_hospital_successfully/add_hospital_successfully.dart';
import '../view/hospital_speciatiles.dart/hospital_specialites.dart';
import '../view/hospital_speciatiles.dart/hospital_specialites.dart';
import '../view/hospital_speciatiles.dart/hospital_specialites.dart';
import 'package:dio/dio.dart';
import 'package:image_picker_web/image_picker_web.dart';

class GetAllHospitalViewModel with ChangeNotifier {
  final _getAllHospitalRepository = HospitalRepository();
  GetAllHospitals? hospitals;
  bool isLoading = true;
  List<Specilities>? specilityList = [];
  List<String?> selectedSpecility = [];
  List<BrachDetailsModel?> bracnhesList = [];

  MediaInfo? selectedImage;
  HospitalResponseModel? selectedHospital;
  bool submitting = false;
  String specilityError = "";
  bool isShowError = false;

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
    //notifyListeners();
    Navigator.pop(context);
    if (result.status == 200) {
      showSuccessMessage(context);
    }
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
                  title: 'Added Hospital Successfully',
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

    final dio = Dio();
    final result = await dio.get(
        "https://doctopad-a2d-dev.el.r.appspot.com/api/v1/hospital_specialities");
    final hosptialModel = HospitalSpecialitiesModel.fromJson(result.data);
    specilityList = hosptialModel.specilityList;
    notifyListeners();
  }

  addSpecility(String name) async {
    final body = {"created_by": "mahesh", "speciality_name": name};
    // final dio = Dio();
    final result = await BaseApiClient()
        .client
        .post("api/v1/hospital_specialities", data: body);
    if (result.statusCode == 200) {
      //success
      getSpecilitiesList();
    } else {
      //fail
    }
  }

  addBranch({String? branName, String? branchAddress}) async {
    if (this.selectedSpecility.isEmpty) {
      this.isShowError = true;
      notifyListeners();
      return;
    }
    this.isShowError = false;
    final specilityId = this.selectedSpecility.map((e) => {"id": e});

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
    final response = await BaseApiClient()
        .client
        .post("api/v1/hospitals_branch", data: payload);
    print(response.data);
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

  getBranchesByHospitalsId(String hospitalId) async {
    final result =
        await _getAllHospitalRepository.getBranchesByHospitalsId(hospitalId);
    if (result.status == 0) {
      bracnhesList = [];
      notifyListeners();
      return false;
    } else {
      bracnhesList = result.body!;
      notifyListeners();
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