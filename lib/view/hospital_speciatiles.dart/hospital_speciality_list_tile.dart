import 'package:cgg_base_project/res/app_colors.dart';
import 'package:cgg_base_project/view/hospital_speciatiles.dart/add_specilites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/doctor_view_model.dart';
import '../../view_model/hospitalSpecialityModel.dart';
import '../../view_model/hospital_viewmodel.dart';

class SpecialityListTile extends StatelessWidget {
  const SpecialityListTile(
      {super.key, required this.name, required this.specilities});
  final String? name;
  final Specilities? specilities;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name ?? "",
                  style: TextStyle(
                      fontFamily: 'Muli',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    width: 25,
                    height: 25,
                    child: IconButton(
                        onPressed: () {
                          Provider.of<GetAllHospitalViewModel>(context,
                                  listen: false)
                              .setEditSpecility(specilities!);
                          showSpeciality(context);
                        },
                        icon: Icon(
                          Icons.edit,
                          color: AppColors.app_bg_color,
                        )))
              ],
            ),
          )),
    );
  }

  showSpeciality(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
            content:
                SizedBox(width: 350, height: 250, child: AddSpecilities()));
      },
    );
  }
}
