import 'package:cgg_base_project/data/bae_api_client.dart';
import 'package:cgg_base_project/model/hospital_details/add_hospital.dart';
import 'package:cgg_base_project/model/hospital_details/get_all_hospital.dart';
import '../model/entity/hospital_entity.dart/add_hospital_entity.dart';
import '../model/hospital_details/branches_list_model.dart';
import '../model/hospital_details/hospitail_specialites.dart';

class HospitalRepository {
  final _baseClient = BaseApiClient();
  Future<GetAllHospitals> getAllHospitals() async {
    final respnse = await _baseClient.getCall('api/v1/hospitals');
    return GetAllHospitals.fromJson(respnse);
  }

  Future<AddHospital> addHospital(AddHospitalEntity addHospitalEntity) async {
    final respnse = await _baseClient.postCall('api/v1/hospitals',
        payload: addHospitalEntity.toJson());
    return AddHospital.fromJson(respnse);
  }

  Future<HospitalSpecialities> hospitalSpecialities() async {
    final respnse = await _baseClient.getCall('api/v1/hospital_specialities');
    return HospitalSpecialities.fromJson(respnse);
  }

  Future<BranchesList> getBranchesByHospitalsId(String hospitalId) async {
    final respnse = await _baseClient
        .getCall('api/v1/hospitals_branches/hospital/$hospitalId');
    if (respnse == null) {
      return BranchesList(status: 0);
    }
    return BranchesList.fromJson(respnse);
  }
}
