import 'package:cgg_base_project/data/bae_api_client.dart';
import 'package:cgg_base_project/model/otp.dart/create_otp.dart';
import 'package:cgg_base_project/model/otp.dart/verify_otp.dart';

import '../model/entity/otp_entity.dart/create_otp_entity.dart';
import '../model/entity/otp_entity.dart/verify_otp_entity.dart';

class CreateOtpRepository {
  final _baseClient = BaseApiClient();
  Future<CreateOtp> createOtp(CreateOtpEntity createOtpEntity) async {
    final respnse = await _baseClient.postCall(
        'https://doctopad-a2d-dev.el.r.appspot.com/api/v1/doctors',
        payload: createOtpEntity.toJson());
    return CreateOtp.fromJson(respnse);
  }
}

///verify otp post,
class VerifyOtpRepository {
  final _baseClient = BaseApiClient();
  Future<VerifyOtp> verifyOtp(VerifyOtpEntity verifyOtpEntity) async {
    final respnse = await _baseClient.postCall(
        'https://doctopad-a2d-dev.el.r.appspot.com/api/v1/otp/verify_otp?entity_type=mobile',
        payload: verifyOtpEntity.toJson());
    return VerifyOtp.fromJson(respnse);
  }
}
