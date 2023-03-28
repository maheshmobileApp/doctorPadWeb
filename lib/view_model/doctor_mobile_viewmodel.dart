import 'package:cgg_base_project/model/entity/add_doctor_entity.dart';
import 'package:cgg_base_project/res/app_colors.dart';
import 'package:flutter/material.dart';
import '../model/entity/doctor_mobile_password_entity.dart';
import '../repository/add_doctor_repository.dart';

class DoctorMobilePasswordViewModel with ChangeNotifier {
  final _doctorMobilePasswordRepository = DoctorMobilePasswordRepository();

  Future<void> doctorMobilePassword(BuildContext context,
    String? mobileNumber, String? password,
  ) async {
      final result = await _doctorMobilePasswordRepository.doctorMobilePassword( DoctorMobilePasswordEntity(
        password,
        mobileNumber, mobileNumber: '',


        ) as AddDoctorEntity
      );
   if (result.status == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result.message ?? ''),
          backgroundColor: AppColors.app_bg_color,
          ));
    }
    notifyListeners();
  }
}
