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
    final response = await Dio().get(
        "https://api.sportsdata.io/v3/nfl/scores/json/Rookies/2022?key=2e3a5a52b7c047359ebb58c8b6c7590f");
    print("response $response");

    //https://api.sportsdata.io/v3/nfl/scores/json/Rookies/2022?key=2e3a5a52b7c047359ebb58c8b6c7590f
    //    late final Dio _client = Dio(
    //   BaseOptions(
    //     baseUrl: ApiConstants.baseUrlPQMS,
    //   ),
    // );
    return GetAllDoctor.fromJson(respnse);
  }

  Future<DoctorSpecialitiesRes >doctorSpecialitiesRes () async {
    final respnse = await _baseClient.getCall(
        'api/v1/doctor_specialities');
    return DoctorSpecialitiesRes .fromJson(respnse);
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