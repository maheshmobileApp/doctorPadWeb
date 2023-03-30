import 'package:cgg_base_project/model/entity/otp_entity.dart/verify_otp_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../model/entity/otp_entity.dart/create_otp_entity.dart';
import '../repository/create_otp.dart';
class CreateOtpViewModel with ChangeNotifier {
  final _createOtpRepository = CreateOtpRepository();
   Future<void> createOtp(BuildContext context,
      String? entity) async {
    final result = await _createOtpRepository.createOtp(CreateOtpEntity(
        entity: entity));
    if (result.status == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result.message ?? ''),
          
          ));
    }
    notifyListeners();
  }
}
/////Verify otp post
class VerifyOtpViewModel with ChangeNotifier {
  final _verifyOtpRepository = VerifyOtpRepository();
   Future<void> verifyOtp(BuildContext context,
      String? entity,int? otpValue,dynamic) async {
    final result = await _verifyOtpRepository.verifyOtp(VerifyOtpEntity(
        entity: entity,
        otpValue: otpValue));
    if (result.id  == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result.toString()?? ''),
          
          ));
    }
    notifyListeners();
  }
}