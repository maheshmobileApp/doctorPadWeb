import 'package:cgg_base_project/res/app_colors.dart';
import 'package:flutter/material.dart';
import '../../constants/routes_constants.dart';
import '../button_component.dart';

class HeadderWidget extends StatelessWidget {
  HeadderWidget(
      {Key? key,
      this.text,
      this.title,
      this.appButton,
      this.routes,
      required this.onTap})
      : super(key: key);
  final String? text;
  final String? title;
  final AppButton? appButton;
  final RoutesList? routes;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      alignment: Alignment.center,
      color: AppColors.color9,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text ?? 'Hospitals View',
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Muli',
                  fontWeight: FontWeight.bold),
            ),
            Container(
              child: Row(children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    width: 300,
                    child: TextField(
                      maxLines: 1,
                      style: TextStyle(fontSize: 17, fontFamily: 'Muli,'),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Icon(Icons.search,
                              color: Theme.of(context).iconTheme.color),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          fillColor: AppColors.color1,
                          contentPadding: EdgeInsets.zero,
                          hintText: 'Search',
                          helperStyle: TextStyle(fontFamily: 'Muli')),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppButton(
                      text: title ?? '+ Add Hospital',
                      primaryColor: AppColors.backgroundcolor,
                      // myEdgeInsets:
                      //     EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      borderRadius: BorderRadius.circular(3),
                      onPressed: () {
                        this.onTap();
                      }),
                ),
                SizedBox(
                    // height: MediaQuery.of(context).size.height/ 1,
                    height: 20,
                    width: 20,
                    child: Image.asset(
                      'assets/images/user2.png',
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width / 10,
                    ))
              ]),
            )
            /* TextField(
            maxLines: 1,
            style: TextStyle(fontSize: 17, fontFamily: 'Muli,'),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              filled: true,
              prefixIcon: Icon(Icons.search,
                  color: Theme.of(context).iconTheme.color),
              border: Outline\InputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              fillColor: AppColors.color1,
              contentPadding: EdgeInsets.zero,
              hintText: 'Search',
              helperStyle: TextStyle(fontFamily: 'Muli')),
            ),
            AppButton(
            text: title ?? '+ Add Hospital',
            primaryColor: AppColors.backgroundcolor,
            // myEdgeInsets:
            //     EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            borderRadius: BorderRadius.circular(3),
            onPressed: () {
              this.onTap();
            }),
            SizedBox(
            height: 20,
            width: 20,
            ),
            SizedBox(
            // height: MediaQuery.of(context).size.height/ 1,
            height: 20,
            width: 20,
            child: Image.asset(
              'assets/images/user2.png',
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 10,
            )),
            SizedBox(
            height: 20,
            width: 5,
            ),
            Text(
            'User Name',
            style: TextStyle(color: AppColors.color5, fontFamily: 'Muli'),
            )*/
          ],
        ),
      ),
    );
  }
}
