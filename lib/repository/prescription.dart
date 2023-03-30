import '../data/bae_api_client.dart';
import '../model/prescription.document.dart/get_all_prescription.dart';

class GetAllPrescriptionDocRepository {
  final _baseClient = BaseApiClient();
  Future<GetAllPrescriptionDoc> getAllPrescriptionDoc() async {
    final respnse = await _baseClient.getCall(
        'https://doctopad-a2d-dev.el.r.appspot.com/api/v1/doctors',
        );
    return GetAllPrescriptionDoc.fromJson(respnse);
  }
}
