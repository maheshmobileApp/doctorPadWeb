import 'package:cgg_base_project/view/hospital_speciatiles.dart/hospital_speciality_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/hospital_viewmodel.dart';

class HospitalSpecialites extends StatelessWidget {
  HospitalSpecialites({super.key});
  TextEditingController _specilyControll = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GetAllHospitalViewModel>();
    // viewModel.getSpecilitiesList();
    return Container(
        child: GridView.count(
            crossAxisCount: 5,
            childAspectRatio: (1 / .2),
            children: List.generate(viewModel.specilityList!.length, (index) {
              final hospitalData = viewModel.specilityList![index];
              return SpecialityListTile(name: hospitalData.specialityName);
            })));
  }
}
