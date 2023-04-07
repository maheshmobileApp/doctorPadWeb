
import 'package:cgg_base_project/model/entity/doctor_entity.dart/add_doctor_entity.dart';
import 'package:cgg_base_project/model/entity/add_doctor_specialites_entity';
import 'package:cgg_base_project/model/get_all_doctor.dart';



import '../data/bae_api_client.dart';
import '../model/add_doctor_res.dart';


class AddDoctorRepository {
  final _baseClient = BaseApiClient();
  Future<AddDoctor> addDoctor(AddDoctorEntity addDoctorEntity) async {
    final respnse = await _baseClient.postCall(
        'api/v1/doctors',
        payload: addDoctorEntity.toJson());
    return AddDoctor.fromJson(respnse);
  }

  Future<GetAllDoctor> getAllDoctor() async {
    final respnse = await _baseClient
        .getCall('api/v1/doctors');
    return GetAllDoctor.fromJson(respnse);
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
