import 'package:flutter/material.dart';

import '../../res/app_colors.dart';
import '../../res/components/button_component.dart';
import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';

class DoctorSpecialities extends StatelessWidget {
  const DoctorSpecialities({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SidepanelWidgets(),
        Column(
          children: [
            // OptionWidgets(
            //   isAcceptTermsAndConditions: false,
            //   onTap: () {},
            //   text: ' Doctror Specialites',
            // ),
            SizedBox(
              height: 20,
            ),
            Container(
                  height:  MediaQuery.of(context).size.height/1.2,
                  width:  MediaQuery.of(context).size.width/3,
                    padding: EdgeInsets.all(40),
                decoration: BoxDecoration(
                   // color: AppColors.backgroundcolor,
                   //color: AppColors.backgroundcolor,
                        gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.centerLeft,
                  colors: [
                  AppColors.color10,
                  AppColors.backgroundcolor
                ]),
                    borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        Text('Doctor Specialites',style: 
                        TextStyle(
                          color: AppColors.color1,
                          fontSize:18,
                          fontFamily: 'Muli'
                          ),),
                        SizedBox(height: 20,),
                    Container(
                      child: Center(
                        child: AppButton(
                            text: 'Submit',
                            color: AppColors.backgroundcolori,
                            myEdgeInsets:
                                EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                            primaryColor: AppColors.color1,
                            onPressed: () {
                             showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: const Text("Doctor Specialites"),
                                        //content: const Text("heart"),
                                        actions: <Widget>[
                                          TextButton(
                                           onPressed: () {
                                          Navigator.of(ctx).pop();
                                                  },
                                           child: Container(
                                    color: AppColors.color1,
                                     padding: const EdgeInsets.all(14),
                                      child: const Text("Submit"),
                                        ),
                                          ),
                                        ],
                                      ),
                                    );
                            }),
                      ),
                    )
                    ]),
            ),
            
          ])
        ]),
    );
   
}
}