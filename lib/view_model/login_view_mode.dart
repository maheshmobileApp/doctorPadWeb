import 'dart:io';

import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  bool isLoading = false;
  int count = 0;

  loginTheUser(String userName, String password) {
    count++;
    notifyListeners();
  }
}
