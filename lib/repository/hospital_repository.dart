import 'package:cgg_base_project/data/bae_api_client.dart';
import 'package:cgg_base_project/model/entity/add_hospital_entity.dart';
import 'package:cgg_base_project/model/entity/hospital_entity.dart/add_hospital_branch_entity.dart';
import 'package:cgg_base_project/model/entity/hospital_entity.dart/add_hospital_speciality_entity.dart';
import 'package:cgg_base_project/model/hospital_details/add_hospital.dart';
import 'package:cgg_base_project/model/hospital_details/add_hospital_branch.dart';
import 'package:cgg_base_project/model/hospital_details/add_hospital_speciality.dart';
import 'package:cgg_base_project/model/hospital_details/get_all_hospital.dart';
import 'package:cgg_base_project/model/hospital_details/get_all_hospital_branches.dart';
import 'package:flutter/material.dart';

import '../model/hospital_details/get_all_hospital_specialites.dart';

//get
class GetAllHospitalSpecialitesRepository {

  
  final _baseClient = BaseApiClient();
  Future<GetAllHospitalSpecialites> getAllHospitalSpecialites() async {
    final respnse = await _baseClient.getCall(
        'http://doctopad-a2d-dev.el.r.appspot.com/api/v1/hospital_specialities');
    return GetAllHospitalSpecialites.fromJson(respnse);
  }
}

///Add Hospital Speciality/post
class AddHospitalSpecialityRepository {
  final _baseClient = BaseApiClient();
  Future<AddHospitalSpeciality> addHospitalSpeciality(
      AddHospitalSpecialityEntity addHospitalSpecialityEntity) async {
    final respnse = await _baseClient.postCall(
        'http://doctopad-a2d-dev.el.r.appspot.com/api/v1/hospital_specialities',
        payload: addHospitalSpecialityEntity.toJson());
    return AddHospitalSpeciality.fromJson(respnse);
  }
}

/////Get All Hospital,/get
class GetAllHospitalRepository {
  final _baseClient = BaseApiClient();
  Future<GetAllHospitals> getAllHospitals() async {
    final respnse = await _baseClient.getCall(
        'http://doctopad-a2d-dev.el.r.appspot.com/api/v1/hospital_specialities');
    return GetAllHospitals.fromJson(respnse);
  }
}

///Get Add Hospital /post

class AddHospitalRepository {
  final _baseClient = BaseApiClient();
  Future<AddHospital> addHospital(AddHospitalEntity addHospitalEntity) async {
    final respnse = await _baseClient.postCall(
        'http://doctopad-a2d-dev.el.r.appspot.com/api/v1/hospitals',
        payload: addHospitalEntity.toJson());
    return AddHospital.fromJson(respnse);
  }
}

///Get all hospital branches /get
class GetAllHospitalBranchesRepository {
  final _baseClient = BaseApiClient();
  Future<GetAllHoapitalBranches> getAllHoapitalBranches() async {
    final respnse = await _baseClient.getCall(
        'http://doctopad-a2d-dev.el.r.appspot.com/api/v1/hospitals_branch');
    return GetAllHoapitalBranches.fromJson(respnse);
  }
}

/////Add hospital branchs /post
class AddHospitalBranchRepository {
  final _baseClient = BaseApiClient();
  Future<AddHospitalBranch> addHospitalBranch(
      AddHospitalBranchEntity addHospitalBranchEntity) async {
    final respnse = await _baseClient.postCall(
        'https://doctopad-a2d-dev.el.r.appspot.com/api/v1/hospitals_branch  ',
        payload: addHospitalBranchEntity.toJson());
    return AddHospitalBranch.fromJson(respnse);
  }
}
