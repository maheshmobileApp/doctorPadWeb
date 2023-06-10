import 'package:cgg_base_project/res/app_colors.dart';
import '../../res/components/button_component.dart';
import '../../res/constants/routes_constants.dart';
import 'package:cgg_base_project/utils/regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../res/components/login_textfeild.dart';
import '../../res/components/logo_widget.dart';

class LoginWebView extends StatelessWidget {
  LoginWebView({super.key});

  final _formKey = GlobalKey<FormState>();
  TextEditingController _mobileController = TextEditingController(text: "");
  TextEditingController _passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundcolori,
        body: Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [AppColors.app_bg_color, AppColors.color12])),
            child: Center(
              child: Container(
                height: 500,
                width: 500,
                decoration: BoxDecoration(
                    color: AppColors.color1,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _sizedBox(height: 50),
                    LogoWidget(),
                    _sizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          LoginTextFeild(
                            controller: _mobileController,
                            hintText: 'User Mobile number',
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: true, signed: true),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            maxLength: 10,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Mobile number';
                              } else if (!phonenovalid(value)) {
                                return 'Enter Valid Mobile number';
                              }
                            },
                          ),
                          _sizedBox(height: 15),
                          // _sizedBox(height: MediaQuery.of(context).size.height/ 30),
                          LoginTextFeild(
                            controller: _passwordController,
                            icon: Icons.lock,
                            hintText: 'Password',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Password';
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    _sizedBox(height: 35),
                    AppButton(
                        text: 'LOGIN',
                        // myEdgeInsets:
                        //     EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                        onPressed: () {
                          // context.pop();
                          // GoRouter.of(context).replace(RoutesList.hospitalView);
                          context.go(RoutesList.dashBoardScreen);
                          // if(_formKey.currentState!.validate()){
                          //   context.go(RoutesList.hospitalView);
                          // }
                          //context.replaceNamed(RoutesList.hospitalView);
                        }),
                    _sizedBox(height: 35),

                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: AppColors.color10,
                      ),
                    ),
                    //sizedBox(height: MediaQuery.of(context).size.height/ 30),
                  ],
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
