import 'package:cgg_base_project/model/patients.dart/add_patients.dart';

import '../data/bae_api_client.dart';
import '../model/entity/patient_entity/add_patients_entity.dart';
import '../model/patients.dart/get_all_patients.dart';
class GetAllPatientsRepository {
  final _baseClient = BaseApiClient();
  Future<GetAllPatients> getAllPatients() async {
    final respnse = await _baseClient.getCall(
        'https://doctopad-a2d-dev.el.r.appspot.com/api/v1/doctors',
        );
    return GetAllPatients.fromJson(respnse);
  }
}


/////Add patients /post method
class AddPatientRepository {
  final _baseClient = BaseApiClient();
  Future<AddPatient> addPatient(
      AddPatientEntity addPatientEntity) async {
    final respnse = await _baseClient.postCall(
        ' https://doctopad-a2d-dev.el.r.appspot.com/api/v1/patients ',
        payload: addPatientEntity.toJson());
    return AddPatient .fromJson(respnse);
  }
}
