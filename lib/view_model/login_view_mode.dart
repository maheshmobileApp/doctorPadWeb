import 'dart:io';

import 'package:cgg_base_project/data/bae_api_client.dart';
import 'package:cgg_base_project/model/login_payload.dart';
import 'package:cgg_base_project/repository/login_repository.dart';
import 'package:cgg_base_project/res/components/loader.dart';
import 'package:cgg_base_project/res/components/toast.dart';
import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  final _loginRepository = LoginRepository();
  loginTheUser(String userName, String password) async {
    AppLoader.showLoader(message: "login...");
    final loginRequestPayload = LoginPayload(
        iMEI: "45646346",
        deviceId: "564858457848",
        password: password,
        username: userName);
    final result = await _loginRepository.loginTheUser(loginRequestPayload);
    AppLoader.hideLoader();
    if (result.statusCode == ApiErrorCodes.success) {
    } else if (result.statusCode == ApiErrorCodes.invalid) {
      //alert with message
      //result.statusMessage
      showToast(result.statusMessage ?? "");
    } else {}
    notifyListeners();
  }
}
