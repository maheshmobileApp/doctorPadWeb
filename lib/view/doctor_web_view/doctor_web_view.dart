import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../res/app_colors.dart';
import '../../res/components/option_widgets/option_widgets.dart';
import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';
import '../../res/constants/routes_constants.dart';
class DoctorWebView extends StatelessWidget {
  void FunctionString;
  final List dummyList = List.generate(10, (index) {
    return {
      "title": "Doctor Details",
      "subtitle": "Name\nDetails ",
    };
  });
  DoctorWebView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        SidepanelWidgets(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OptionWidgets(text: 'Doctor View', title: "+ Add Doctor",isAcceptTermsAndConditions: true,
              onTap:() {
                context.go(RoutesList.doctorAddDetails);
            },
                ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 220,top: 10,),
                  child: Text(
                    'Doctor List ',
                    style: TextStyle(fontSize: 15, fontFamily: 'Muli',fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width - 150,
              padding: EdgeInsets.all(25),
              child: ListView.builder(
                itemCount: dummyList.length,
                itemBuilder: (context, index) => Card(
                  elevation: 4,
                  margin: EdgeInsets.only(top: 26,left: 200,right: 250,),
                  child: ListTile(
                      leading:Container(
                        decoration: BoxDecoration(
                          border: Border.all(color:  AppColors.color1,width: 3),
                          color:  AppColors.backgroundcolori,
                        ),

                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                          child:   Image.asset('assets/images/doctor.png',color:  AppColors.color1,),
                        ),
                      ),
                    title: Text(dummyList[index]["title"],style: TextStyle(fontFamily: 'Muli',fontSize: 12),),
                    subtitle: Text(dummyList[index]["subtitle"],style: TextStyle(fontFamily: 'Muli',fontSize: 12),),
                    //trailing: const Icon(Icons.add_a_photo),
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
