import 'package:cgg_base_project/data/bae_api_client.dart';
import 'package:cgg_base_project/model/login_payload.dart';
import 'package:cgg_base_project/model/login_response.dart';
import 'package:cgg_base_project/res/constants/api_constants.dart';

class LoginRepository {
final _baseClient = BaseApiClient();
 Future<LoginResponse> loginTheUser(LoginPayload payload) async{
   final respnse = await _baseClient.postCall(ApiConstants.endPoint_MobileLogin,payload: payload.toJson());
   return LoginResponse.fromJson(respnse);  
  }
  
}
