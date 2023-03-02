import 'package:cgg_base_project/utils/regex.dart';

class ValidationMixins {


  String? validatePhoneNumber(value) {
    if (value!.isEmpty) {
      return 'Enter phone number';
    } else if (!phonenovalid(value)) {
      return 'Enter vaild number';
    }
    return null;
  }


  String? validateTitle(value) {
    if (value!.isEmpty) {
      return 'Add title';
    }
    return null;
  }

  String? validateMake(value) {
    if (value!.isEmpty) {
      return 'Enter make';
    }
    return null;
  }

  String? validateModel(value) {
    if (value!.isEmpty) {
      return 'Enter model';
    }
    return null;
  }

  String? validateYear(value) {
    if (value!.isEmpty) {
      return 'Enter year';
    }
    return null;
  }
  String? validateTime(value) {
    if (value!.isEmpty) {
      return 'Enter time';
    }
    return null;
  }
  String? validateFrequency(value) {
    if (value!.isEmpty) {
      return 'Enter frequency';
    }
    return null;
  }

  String? validateDescription(value) {
    if (value!.isEmpty) {
      return 'Add description';
    }
    return null;
}}