import 'package:cgg_base_project/res/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/entity/add_doctor_entity.dart';
import '../repository/add_doctor_repository.dart';
import '../res/constants/routes_constants.dart';

class DoctorViewModel with ChangeNotifier {
  final _addDoctorRepository = AddDoctorRepository();

  Future<void> addDoctor(BuildContext context,
      String doctorNumber, String emailId, String mobileNo, String name) async {
    final result = await _addDoctorRepository.doctorAdd(AddDoctorEntity(
        createdBy: " ",
        doctorRegistrationNumber: doctorNumber,
        emailId: emailId,
        mobileNo: mobileNo,
        name: name, password: '',  ));
    if (result.status == 200) {
      context.go(RoutesList.addDoctorSuccessfully);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result.message ?? ''),
          backgroundColor: AppColors.app_bg_color,
          ));
    }
    notifyListeners();
  }
}
