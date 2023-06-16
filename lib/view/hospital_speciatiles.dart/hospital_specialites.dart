import '../../view_model/dashboard_view_model.dart';
import 'hospital_speciality_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/hospital_viewmodel.dart';

class HospitalSpecialites extends StatelessWidget {
  HospitalSpecialites({super.key});
  TextEditingController _specilyControll = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GetAllHospitalViewModel>();
    final specilityList =
        viewModel.selectedSpecilty == DashBoardMenuOptions.hOSPITALSPECALITIES
            ? viewModel.hospitalspecilityList
            : viewModel.doctorspecilityList;
    return viewModel.hospitalspecilityList!.isEmpty ==
            "no hospital speciality found"
        ? Center(
            child: Text('No Specialities'),
          )
        : Container(
            child: GridView.count(
                crossAxisCount: 5,
                childAspectRatio: (1 / 0.3),
                children: List.generate(specilityList!.length, (index) {
                  final hospitalData = specilityList![index];
                  return SpecialityListTile(name: hospitalData.specialityName);
                })));
  }
}
