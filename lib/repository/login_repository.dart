import 'package:cgg_base_project/data/bae_api_client.dart';
import 'package:cgg_base_project/model/login_payload.dart';
import 'package:cgg_base_project/model/login_response.dart';
import 'package:cgg_base_project/res/constants/api_constants.dart';

class LoginRepository {
final _baseClient = BaseApiClient();
 Future<LoginResponse> loginTheUser(LoginPayload payload){
   final baseClient = _baseClient.postCall(ApiConstants.endPoint_MobileLogin,payload: payload.toJson());
   
   

    
  }
}
// }{
//     "status_Message": "user not found for given user name",
//     "status_Code": 204,
//     "time": "2022-11-26T11:03:32.392"
// }