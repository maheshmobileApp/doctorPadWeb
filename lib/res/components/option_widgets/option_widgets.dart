import 'package:cgg_base_project/res/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/routes_constants.dart';
import '../button_component.dart';
class OptionWidgets extends StatelessWidget {
  OptionWidgets(
      {Key? key,
      this.text,
      this.title,
      this.appButton,
      this.routes,
      required this.isAcceptTermsAndConditions,
      required this.onTap})
      : super(key: key);
  final String? text;
  final String? title;
  final AppButton? appButton;
  final RoutesList? routes;
  bool isAcceptTermsAndConditions = false;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
     return Container(
    //     height:  MediaQuery.of(context).size.height/20,
    //       width:  MediaQuery.of(context).size.width/4,
     height: 75,
     width: MediaQuery.of(context).size.width - 120,
      alignment: Alignment.center,
      color: AppColors.color9,
      padding: EdgeInsets.only(left: 25, right: 25),
      child: Row(
        children: [
          Text(
            text ?? 'Hospitals View',
            style: TextStyle(fontSize: 25,fontFamily: 'Muli',fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Container(
                      margin: EdgeInsets.only(left: 90,right: 15),
                      height: 36,
                      width: 250,
                      child: TextField(
                        maxLines: 1,
                        style: TextStyle(fontSize: 17,fontFamily: 'Muli,'),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Icon(Icons.search,
                              color: Theme.of(context).iconTheme.color),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          fillColor: AppColors.color1,
                          contentPadding: EdgeInsets.zero,
                          hintText: 'Search',
                          helperStyle: TextStyle(fontFamily: 'Muli')
                        ),
                      ),
                    ),
                    if (isAcceptTermsAndConditions) ...{
                      AppButton(
                          text: title ?? '+ Add Hospital',
                          primaryColor: AppColors.backgroundcolor,
                          myEdgeInsets: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          borderRadius: BorderRadius.circular(3),
                          onPressed: () {
                            this.onTap();
                          })
                    },
                    SizedBox(
                      // height: 20,
                      // width: 20,
                      height: MediaQuery.of(context).size.height/ 30,
                      width: MediaQuery.of(context).size.width/ 30,
                    ),
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          'assets/images/user2.png',
                        )),
                    SizedBox(
                      height: 20,
                      width: 5,
                    ),
                    Text(
                      'User Name',
                      style: TextStyle(
                        color: AppColors.color5,
                        fontFamily: 'Muli'
                      ),
                    ),
                  ])))
        ],
      ),
    );
  }
}
