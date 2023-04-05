import 'package:cgg_base_project/data/bae_api_client.dart';
import 'package:cgg_base_project/model/login_payload.dart';
import 'package:cgg_base_project/model/login_response.dart';
import 'package:cgg_base_project/res/constants/api_constants.dart';

// import '../model/entity/otp_entity.dart/create_otp_entity.dart';
// import '../model/entity/otp_entity.dart/verify_otp_entity.dart';
import '../model/otp.dart/create_otp.dart';
import '../model/otp.dart/verify_otp.dart';

class LoginRepository {
final _baseClient = BaseApiClient();
 Future<LoginResponse> loginTheUser(LoginPayload payload) async{
   final respnse = await _baseClient.postCall(ApiConstants.endPoint_MobileLogin,payload: payload.toJson());
   return LoginResponse.fromJson(respnse);  
  }

  // Future<CreateOtp> createOtp(CreateOtpEntity createOtpEntity) async {
  //   final respnse = await _baseClient.postCall(
  //       'https://doctopad-a2d-dev.el.r.appspot.com/api/v1/doctors',
  //       payload: createOtpEntity.toJson());
  //   return CreateOtp.fromJson(respnse);
  // }
  
  // Future<VerifyOtp> verifyOtp(VerifyOtpEntity verifyOtpEntity) async {
  //   final respnse = await _baseClient.postCall(
  //       'https://doctopad-a2d-dev.el.r.appspot.com/api/v1/otp/verify_otp?entity_type=mobile',
  //       payload: verifyOtpEntity.toJson());
  //   return VerifyOtp.fromJson(respnse);
  // }
  
}
