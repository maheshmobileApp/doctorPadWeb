import 'package:cgg_base_project/model/entity/doctor_entity.dart/add_doctor_entity.dart';
import 'package:cgg_base_project/model/get_all_doctor.dart';
import 'package:dio/dio.dart';

import '../data/bae_api_client.dart';
import '../model/add_doctor_res.dart';
import '../model/doctor_model.dart/doctor_specialites.dart';

class AddDoctorRepository {
  final _baseClient = BaseApiClient();
  Future<AddDoctorResponse> addDoctor(AddDoctorEntity addDoctorEntity) async {
    final respnse = await _baseClient.postCall('api/v1/doctors',
        payload: addDoctorEntity.toJson());
    return AddDoctorResponse.fromJson(respnse);
  }

  Future<GetAllDoctor> getAllDoctor() async {
    final respnse = await _baseClient.getCall('api/v1/doctors');
    return GetAllDoctor.fromJson(respnse);
  }

  Future<GetAllDoctor> getAllDoctorByBranch(String branchID) async {
    print("branch id $branchID");

    final respnse =
        await _baseClient.getCall('api/v1/doctors/branch/branch_id=$branchID');
    print(respnse);
    if (respnse == null) {
      return GetAllDoctor(status: 0);
    }
    return GetAllDoctor.fromJson(respnse);
  }

  Future<DoctorSpecialitiesRes> doctorSpecialitiesRes() async {
    final respnse = await _baseClient.getCall('api/v1/doctor_specialities');
    return DoctorSpecialitiesRes.fromJson(respnse);
  }
  // Future<GetDoctorSpecialites> getDoctorSpecialites() async {
  //   final respnse = await _baseClient.getCall(
  //       'http://doctopad-a2d-dev.el.r.appspot.com/api/v1/doctor_specialities');
  //   return GetDoctorSpecialites.fromJson(respnse);
  // }

//   Future<AddDoctorSpecialites> addDoctorSpecialites(
//       AddDoctorSpecialitesEntity addDoctorSpecialitesEntity) async {
//     final respnse = await _baseClient.postCall(
//         'http://doctopad-a2d-dev.el.r.appspot.com/api/v1/doctor_specialities',
//         payload: addDoctorSpecialitesEntity.toJson());
//     return AddDoctorSpecialites.fromJson(respnse);
//   }
}
/*
Firebase issue
https://stackoverflow.com/questions/37369778/firebase-login-using-power-shell
 */