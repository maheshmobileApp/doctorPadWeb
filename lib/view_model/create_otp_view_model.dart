// import '../model/entity/otp_entity.dart/verify_otp_entity.dart';
// import 'package:flutter/material.dart';
// import '../model/entity/otp_entity.dart/create_otp_entity.dart';
// import '../repository/login_repository.dart';


// class CreateOtpViewModel with ChangeNotifier {
//   final _loginRepository = LoginRepository();
//    Future<void> createOtp(BuildContext context,
//       String? entity) async {
//     final result = await _loginRepository.createOtp(CreateOtpEntity(
//         entity: entity));
//     if (result.status == 200) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(result.message ?? ''),
          
//           ));
//     }
//     notifyListeners();
//   }
//    Future<void> verifyOtp(BuildContext context,
//       String? entity,int? otpValue,dynamic) async {
//     final result = await _loginRepository.verifyOtp(VerifyOtpEntity(
//         entity: entity,
//         otpValue: otpValue));
//     if (result.id  == 200) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(result.toString()),
          
//           ));
//     }
//     notifyListeners(); 
//   }
// }
