import 'package:cgg_base_project/model/add_doctor_specialites.dart';
import 'package:cgg_base_project/model/add_doctor_specialites.dart';
import 'package:cgg_base_project/model/entity/add_doctor_entity.dart';
import 'package:cgg_base_project/model/entity/add_doctor_specialites_entity';
import 'package:cgg_base_project/model/entity/doctor_mobile_password_entity.dart';
import 'package:cgg_base_project/model/get_all_doctor.dart';
import 'package:cgg_base_project/model/get_doctors_speciality.dart';
import 'package:dio/dio.dart';

import '../data/bae_api_client.dart';
import '../model/add_doctor_res.dart';
import '../model/doctor_mobile_password.dart';

class AddDoctorRepository {
  final _baseClient = BaseApiClient();
  Future<AddDoctorRes> doctorAdd(AddDoctorEntity addDoctorEntity) async {
    final respnse = await _baseClient.postCall(
        'https://doctopad-a2d-dev.el.r.appspot.com/api/v1/doctors',
        payload: addDoctorEntity.toJson());
    return AddDoctorRes.fromJson(respnse);
  }
}

////Get all doctor,

class GetAllDoctorRepository {
  final _baseClient = BaseApiClient();
  Future<GetAllDoctor> getAllDoctor() async {
    final respnse = await _baseClient
        .getCall('https://doctopad-a2d-dev.el.r.appspot.com/api/v1/doctors');
    return GetAllDoctor.fromJson(respnse);
  }
}

//////Doctor mobile password

class DoctorMobilePasswordRepository {
  final _baseClient = BaseApiClient();
  Future<DoctorMobilePassword> doctorMobilePassword(
      DoctorMobilePasswordEntity doctorMobilePasswordEntity) async {
    final respnse = await _baseClient.postCall(
        'https://doctopad-a2d-dev.el.r.appspot.com/api/v1/doctors/login',
        payload: doctorMobilePasswordEntity.toJson());
    return DoctorMobilePassword.fromJson(respnse);
  }
}

//////Get Doctor Specialites

class GetDoctorSpecialitesRepository {
  final _baseClient = BaseApiClient();
  Future<GetDoctorSpecialites> getDoctorSpecialites() async {
    final respnse = await _baseClient.getCall(
        'http://doctopad-a2d-dev.el.r.appspot.com/api/v1/doctor_specialities');
    return GetDoctorSpecialites.fromJson(respnse);
  }
}

//Add Doctor Specialites Repository,
class AddDoctorSpecialitesRepository {
  final _baseClient = BaseApiClient();
  Future<AddDoctorSpecialites> addDoctorSpecialites(
      AddDoctorSpecialitesEntity  addDoctorSpecialitesEntity) async {
    final respnse = await _baseClient.postCall(
        'http://doctopad-a2d-dev.el.r.appspot.com/api/v1/doctor_specialities',
        payload: addDoctorSpecialitesEntity.toJson());
    return AddDoctorSpecialites.fromJson(respnse);
  }
}