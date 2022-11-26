import 'dart:io';

import 'package:cgg_base_project/model/login_payload.dart';
import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  bool isLoading = false;
  int count = 0;

  loginTheUser(String userName, String password) {
    final loginRequestPayload =
        LoginPayload(iMEI: "45646346", deviceId: "564858457848", password: password, username: userName);

    notifyListeners();
  }
}
