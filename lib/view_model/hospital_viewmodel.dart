import 'package:cgg_base_project/model/hospital_details/get_all_hospital.dart';
import 'package:cgg_base_project/res/components/toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/bae_api_client.dart';
import '../model/entity/hospital_entity.dart/add_hospital_entity.dart';
import '../repository/hospital_repository.dart';
import '../res/app_colors.dart';
import '../res/constants/routes_constants.dart';

class GetAllHospitalViewModel with ChangeNotifier {
  final _getAllHospitalRepository = HospitalRepository();
  GetAllHospitals? hospitals;
  bool isLoading = true;

  Future<void> getAllHospitals() async {
    final result = await _getAllHospitalRepository.getAllHospitals();
    hospitals = result;
    isLoading = false;
    notifyListeners();
  }

  final _addHospitalRepository = HospitalRepository();
  Future<void> addHospital(
    BuildContext context,
    String? createdBy,
    String? email,
    String? name,
    String? phone,
  ) async {
    final result = await _addHospitalRepository.addHospital(AddHospitalEntity(
      createdBy: createdBy,
      email: email,
      name: name,
      phone: phone,
    ));
       if (result.status == 200) {
        context.go(RoutesList.addHospitalSuccessfully);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(result.message ?? ''),
          backgroundColor: AppColors.app_bg_color,
        ));
      }
      notifyListeners();
     }
    }

//     if (result.status == ApiErrorCodes.success) {
//       //context.go('/details');
//       GoRouter.of(context).go(RoutesList.addHospitalSuccessfully);
//     } else if (result.status == ApiErrorCodes.invalid) {
//       //alert with message
//       //result.statusMessage
//       showToast(result.message?? "");
//     } else {}
//     notifyListeners();
//   }
// }
