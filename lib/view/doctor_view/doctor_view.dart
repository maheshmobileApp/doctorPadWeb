import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../res/app_colors.dart';
import '../../res/components/option_widgets/option_widgets.dart';
import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';
import '../../res/constants/routes_constants.dart';
import '../../view_model/doctor_view_model.dart';
import '../../view_model/login_view_mode.dart';

class DoctorsWebView extends StatefulWidget {
  const DoctorsWebView({super.key});

  @override
  State<DoctorsWebView> createState() => _DoctorsWebViewState();
}

class _DoctorsWebViewState extends State<DoctorsWebView> {
  // var doctorsView =
  //       Provider.of<GetAllDoctorViewModel>(context);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GetAllDoctorViewModel>();

    return Scaffold(
      body: viewModel.isLoading == true
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
                    text: 'Doctor View',
                    title: "+ Add Doctor",
                    isAcceptTermsAndConditions: true,
                    onTap: () {
                      context.go(RoutesList.doctorAddDetails);
                    },
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 220,
                          top: 10,
                        ),
                        child: Text(
                          'Doctor List ',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Muli',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 100,
                    width: MediaQuery.of(context).size.width - 150,
                    padding: EdgeInsets.all(25),
                    child: ListView.builder(
                      itemCount: viewModel.doctors?.body?.length,
                      itemBuilder: (context, index) {
                        final doctorData = viewModel.doctors?.body![index];
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
                                    vertical: 8, horizontal: 15),
                                child: Image.asset(
                                  'assets/images/doctor.png',
                                  color: AppColors.color1,
                                ),
                              ),
                            ),
                            title: Text(
                              doctorData?.name ?? "",
                              style:
                                  TextStyle(fontFamily: 'Muli', fontSize: 12),
                            ),
                            subtitle: Text(
                              doctorData?.emailId ?? "",
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
              )
            ]),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetAllDoctorViewModel>().getAllDoctor();
  }
}
