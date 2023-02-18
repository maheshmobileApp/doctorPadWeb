import 'package:cgg_base_project/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../res/components/option_widgets/option_widgets.dart';
import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';
import '../../res/constants/routes_constants.dart';
class HospitalView extends StatelessWidget {
  final List dummyList = List.generate(10, (index) {
    return {
      "title": "Hospitail Details",
      "subtitle": "Name\n Details ",
    };
  });
  HospitalView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SidepanelWidgets(),
          Column(
            children: [
             OptionWidgets(isAcceptTermsAndConditions: true,onTap:() {
               context.go(RoutesList.hospitalDetails);
    },),
              Text('Hospitals List ', textAlign:TextAlign.left,
                style: TextStyle(fontSize: 15),),
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
                            border: Border.all(color:AppColors.color1,width: 3),
                          color:AppColors.backgroundcolori,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 6),
                          child: Text('Hospital\nLogo',textAlign:TextAlign.center,style:
                          TextStyle(color:AppColors.color1,fontSize:8  ),),
                        ),
                      ),
                      title: Text(dummyList[index]["title"]),
                      subtitle: Text(dummyList[index]["subtitle"]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),

    );
  }
}
