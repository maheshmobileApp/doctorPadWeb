import 'package:flutter/material.dart';

import '../../model/get_all_doctor.dart';
import '../hospital_view/hospital_view.dart';

class DoctorDetailsView extends StatelessWidget {
  DoctorDetailsView({super.key, required this.doctorData});
  DcotorsDetails? doctorData;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(height: 35, width: 75, child: Icon(Icons.close)),
          ),
        ),
        RowWithTitleAndDetials(
            title: "Doctor Name:  ", value: doctorData?.name ?? ""),
        RowWithTitleAndDetials(
            title: "Doctor Mobile:  ", value: doctorData?.mobileNo ?? ""),
        RowWithTitleAndDetials(
            title: "Doctor Register Number:  ",
            value: doctorData?.doctorRegistrationNumber ?? "")
      ]),
    );
  }
}
