import 'package:cgg_base_project/res/constants/api_constants.dart';
import 'package:dio/dio.dart';

class ApiErrorCodes {
  ApiErrorCodes._();
  static const int success = 200;
  static const int invalid = 204;
}

class BaseApiClient {
  late final Dio client = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrlPQMS,
    ),
  );

  Future<dynamic> getCall(String url,
      {String contenType = "application/json"}) async {
    try {
      var respone = await client.get(url,
          options: Options(headers: {
            'Content-Type': contenType,
          }));
      return respone.data;
    } catch (e) {
      print(e);
    }

    /*on SocketException {
     
    } on TimeoutException {
      
    }
  } */
  }

  /*
  "body :{
    ""password"": ""PQMS@2022"",
    ""IMEI"": ""598B6F00-F2DE-4894-8D2C-5B945468B4EA"",
    ""deviceId"": ""598B6F00-F2DE-4894-8D2C-5B945468B4EA"",
    ""username"": ""Tejasvi_IOS""
}"
   */

  Future<dynamic> postCall(String url,
      {dynamic payload, String contenType = "application/json"}) async {
    try {
      var respone = await client.post(url,
          options: Options(headers: {
            'Content-Type': contenType,
          }),
          data: payload);
      return respone.data;
    } catch (e) {
      print(e);
    }
  }

  //login->passing the email and password to viewmodel, viewmodel call the repository - > base client
}


/*

login api call

 */