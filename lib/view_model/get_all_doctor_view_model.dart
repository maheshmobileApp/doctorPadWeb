import 'dart:ffi';

import 'package:cgg_base_project/model/add_doctor_res.dart';
import 'package:cgg_base_project/repository/add_doctor_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class GetAllDoctorViewModel with ChangeNotifier {
  final _getAllDoctorRepository = GetAllDoctorRepository();

  Future<void> getAllDoctor(
    
  ) async {
    final result = await _getAllDoctorRepository.getAllDoctor();
  }

  
}
