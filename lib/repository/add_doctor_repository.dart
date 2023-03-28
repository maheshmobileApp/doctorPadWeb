import 'package:cgg_base_project/model/entity/add_doctor_entity.dart';
import 'package:cgg_base_project/model/entity/doctor_mobile_password_entity.dart';
import 'package:cgg_base_project/model/get_all_doctor.dart';
import 'package:dio/dio.dart';

import '../data/bae_api_client.dart';
import '../model/add_doctor_res.dart';
import '../model/doctor_mobile_password.dart';

class AddDoctorRepository {
final _baseClient = BaseApiClient();
 Future<AddDoctorRes> doctorAdd(AddDoctorEntity addDoctorEntity) async{
   final respnse = await _baseClient.postCall('https://doctopad-a2d-dev.el.r.appspot.com/api/v1/doctors',payload: addDoctorEntity.toJson());
   return AddDoctorRes.fromJson(respnse);  
  }
  
}

class GetAllDoctorRepository {
final _baseClient = BaseApiClient();
 Future<GetAllDoctor> getAllDoctor() async{
   final respnse = await _baseClient.getCall('https://doctopad-a2d-dev.el.r.appspot.com/api/v1/doctors');
   return GetAllDoctor.fromJson(respnse);  
  }

  
  
}


class DoctorMobilePasswordRepository {
final _baseClient = BaseApiClient();
 Future<DoctorMobilePassword> doctorMobilePassword(AddDoctorEntity addDoctorEntity) async{
   final respnse = await _baseClient.postCall('https://doctopad-a2d-dev.el.r.appspot.com/api/v1/doctors/login',payload: DoctorMobilePasswordEntity.fromJson );
   return DoctorMobilePassword.fromJson(respnse);  
  }
  
}