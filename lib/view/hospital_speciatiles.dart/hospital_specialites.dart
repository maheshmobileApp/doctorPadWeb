import 'package:flutter/material.dart';
import '../../res/app_colors.dart';
import '../../res/components/option_widgets/option_widgets.dart';
import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';

class HospitalSpec extends StatelessWidget {
  HospitalSpec({super.key});
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SidepanelWidgets(),
        Column(children: [
          HeadderWidget(
            onTap: () {},
            text: ' Hospitals details',
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.2,
            width: MediaQuery.of(context).size.width / 3,
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
                // color: AppColors.backgroundcolor,
                //color: AppColors.backgroundcolor,
                gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.centerLeft,
                    colors: [AppColors.color10, AppColors.backgroundcolor]),
                borderRadius: BorderRadius.circular(16)),
            child: Column(children: [
              Text(
                'IsActive/IsInActive',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                child: Tooltip(
                  message: 'Is Active/InActive Automatically',
                  child: Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      }),
                ),
              ),
            ]),
          )
        ])
      ]),
    );
  }

  void setState(Null Function() param0) {}
}
