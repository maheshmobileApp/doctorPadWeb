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


class HospitalRepository {
  final _baseClient = BaseApiClient();
  Future<GetAllHospitalSpecialites> getAllHospitalSpecialites() async {
    final respnse = await _baseClient.getCall(
        'http://doctopad-a2d-dev.el.r.appspot.com/api/v1/hospital_specialities');
    return GetAllHospitalSpecialites.fromJson(respnse);
  }
    Future<AddHospitalSpeciality> addHospitalSpeciality(
      AddHospitalSpecialityEntity addHospitalSpecialityEntity) async {
    final respnse = await _baseClient.postCall(
        'http://doctopad-a2d-dev.el.r.appspot.com/api/v1/hospital_specialities',
        payload: addHospitalSpecialityEntity.toJson());
    return AddHospitalSpeciality.fromJson(respnse);
  }
   Future<GetAllHospitals> getAllHospitals() async {
    final respnse = await _baseClient.getCall(
        'http://doctopad-a2d-dev.el.r.appspot.com/api/v1/hospital_specialities');
    return GetAllHospitals.fromJson(respnse);
  }
   Future<AddHospital> addHospital(AddHospitalEntity addHospitalEntity) async {
    final respnse = await _baseClient.postCall(
        'http://doctopad-a2d-dev.el.r.appspot.com/api/v1/hospitals',
        payload: addHospitalEntity.toJson());
    return AddHospital.fromJson(respnse);
  }
   Future<GetAllHoapitalBranches> getAllHoapitalBranches() async {
    final respnse = await _baseClient.getCall(
        'http://doctopad-a2d-dev.el.r.appspot.com/api/v1/hospitals_branch');
    return GetAllHoapitalBranches.fromJson(respnse);
  }
   Future<AddHospitalBranch> addHospitalBranch(
      AddHospitalBranchEntity addHospitalBranchEntity) async {
    final respnse = await _baseClient.postCall(
        'https://doctopad-a2d-dev.el.r.appspot.com/api/v1/hospitals_branch  ',
        payload: addHospitalBranchEntity.toJson());
    return AddHospitalBranch.fromJson(respnse);
  }
   
   
}

