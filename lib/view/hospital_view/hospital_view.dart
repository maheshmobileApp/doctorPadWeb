import 'package:cgg_base_project/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../res/components/option_widgets/option_widgets.dart';
import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';
import '../../res/constants/routes_constants.dart';
import '../../view_model/hospital_viewmodel.dart';

class HospitalView extends StatefulWidget {

  HospitalView({super.key});

  @override
  State<HospitalView> createState() => _HospitalViewState();
}

class _HospitalViewState extends State<HospitalView> {

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GetAllHospitalViewModel>();

    return Scaffold(
      body:  viewModel.isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
      
     : Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SidepanelWidgets(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OptionWidgets(
              isAcceptTermsAndConditions: true,
              onTap: () {
                context.go(RoutesList.hospitalDetails);
              },
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 220,top: 10,),
                  child: Text(
                    'Hospitals List ',
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
                itemCount: viewModel.hospitals?.body?.length,
                itemBuilder: (context, index) {
                        final hospitalData = viewModel.hospitals?.body![index];
                        return Card(
                          elevation: 4,
                          margin: EdgeInsets.only(
                            top: 26,
                            left: 200,
                            right: 250,
                          ),
                          child: ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.color1, width: 3),
                                    
                                color: AppColors.backgroundcolor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 8),
                                child: Image.asset(
                                  'assets/images/hospital_logo.png',
                                  color: AppColors.color1,
                                ),
                              ),
                            ),
                            title: Text(
                              hospitalData?.name ?? "",
                              style:
                                  TextStyle(fontFamily: 'Muli', fontSize: 12),
                            ),
                            subtitle: Text(
                              hospitalData?.email?? "",
                              style:
                                  TextStyle(fontFamily: 'Muli', fontSize: 12),
                            ),
                            //trailing: const Icon(Icons.add_a_photo),
                          ),
                        );
                      },
               
              
              ),
            ),
          ],
        ),
      ]),
    );
  }
     @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read< GetAllHospitalViewModel>().getAllHospitals();
  }
}
