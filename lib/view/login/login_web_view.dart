import 'package:cgg_base_project/res/components/button_component.dart';
import 'package:cgg_base_project/res/constants/routes_constants.dart';
import 'package:cgg_base_project/utils/regex.dart';
import 'package:cgg_base_project/view/hospital_web_view/hospital_web_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../res/components/login_textfeild.dart';
import '../../res/components/logo_widget.dart';

class LoginWebView extends StatelessWidget {
  LoginWebView({super.key});

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1397DB),
      body:Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Color(0xff0A4C6E),
                  Color(0xff1397DB),
                ]
            )
          ),
          child: Center(
            child: Container(
              height: 420,
              width: 450,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  _sizedBox(height: 20),
                  LogoWidget(),
                  _sizedBox(height: 23),
                  LoginTextFeild(
                    hintText: 'User Mobile Number',
                    keyboardType: TextInputType.numberWithOptions(decimal: true,signed: true),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Mobile Number';
                      } else if (!phonenovalid(value)) {
                        return 'Enter Valid Mobile Number';
                      }
                    },
                  ),
                  _sizedBox(height: 10),
                  LoginTextFeild(
                    icon: Icons.lock,
                    hintText: 'Password',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Password';
                      }
                    },
                  ),
                  _sizedBox(height: 30),
                  AppButton(text:'LOGIN', onPressed: () {
                    // if(_formKey.currentState!.validate()){
                    //   context.go(RoutesList.hospitalView);
                    // }
                    context.go(RoutesList.hospitalView);
                  }),
                   _sizedBox(height: 15),
                  Text('Forgot Password?',style: TextStyle(
                      color: Colors.blue
                  ),),
                  _sizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
SizedBox _sizedBox({double? height, double? width}){
    return SizedBox(
      height: height,
      width: width,
    );
}
}
