import 'package:cgg_base_project/data/bae_api_client.dart';
import 'package:cgg_base_project/model/login_payload.dart';
import 'package:cgg_base_project/model/login_response.dart';
import 'package:cgg_base_project/model/reports/reports_model.dart';
import 'package:cgg_base_project/res/constants/api_constants.dart';

class LoginRepository {
  final _baseClient = BaseApiClient();
  Future<LoginResponse> loginTheUser(LoginPayload payload) async {
    final respnse = await _baseClient.postCall(ApiConstants.baseUrl,
        payload: payload.toJson());
    return LoginResponse.fromJson(respnse);
  }

  Future<ReportsModel> getReportsData() async {
    final respnse = await _baseClient.getCall("api/v1/dashboard");
    return ReportsModel.fromJson(respnse);
  }
}
