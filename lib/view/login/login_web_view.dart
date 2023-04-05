import 'package:cgg_base_project/res/app_colors.dart';
import 'package:cgg_base_project/res/components/button_component.dart';
import 'package:cgg_base_project/res/constants/routes_constants.dart';
import 'package:cgg_base_project/utils/regex.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../res/components/login_textfeild.dart';
import '../../res/components/logo_widget.dart';

class LoginWebView extends StatelessWidget {
  LoginWebView({super.key});

  final _formKey = GlobalKey<FormState>();
    TextEditingController _mobileController =
      TextEditingController(text: "");
  TextEditingController _passwordController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundcolori,
        body: Form(
          key: _formKey,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                  AppColors.app_bg_color,
                  AppColors.backgroundcolori
                ])),
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                   height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                      color: AppColors.color1,
                      borderRadius: BorderRadius.circular(16)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                      _sizedBox(height: 20),
                      Align(alignment: Alignment.topCenter,
                        child: LogoWidget(),),
                        _sizedBox(height: 23),
                        Align(
                          alignment: Alignment.center,
                          child: LoginTextFeild(
                            controller: _mobileController,
                            hintText: 'User Mobile number',
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: true, signed: true),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Mobile number';
                              } else if (!phonenovalid(value)) {
                                return 'Enter Valid Mobile number';
                              }
                            },
                          ),
                        ),
                        _sizedBox(height: 10),
                        Align(
                          alignment: Alignment.center,
                          child: LoginTextFeild(
                            controller: _passwordController,
                            icon: Icons.lock,
                            hintText: 'Password',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Password';
                              }
                            },
                          ),
                        ),
                        
                        _sizedBox(height: 30),
                        Align(
                          alignment: Alignment.center,
                          child: AppButton(
                              text: 'LOGIN',
                              myEdgeInsets: EdgeInsets.symmetric(horizontal: 80,vertical: 17),
                              onPressed: () {
                                // if(_formKey.currentState!.validate()){
                                //   context.go(RoutesList.hospitalView);
                                // }
                                context.go(RoutesList.hospitalView);
                              }),
                        ),
                        _sizedBox(height: 15),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: AppColors.backgroundcolori,
                            ),
                          ),
                        ),
                        _sizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _sizedBox({double? height, double? width}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
