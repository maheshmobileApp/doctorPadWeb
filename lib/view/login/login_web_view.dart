import 'package:cgg_base_project/view/hospital_web_view/hospital_web_view.dart';
import 'package:flutter/material.dart';
import '../../res/components/login_textfeild.dart';

class LoginWebView extends StatelessWidget {
  LoginWebView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1397DB),
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 400,
              width: 450,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Image.asset(
                    'assets/doctpad.png',
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  LoginTextFeild(
                    hintText: 'User Mobile Number',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Mobile Number';
                      } else if (!phonenovalid(value)) {
                        return 'Enter Valid Mobile Number';
                      }
                    },
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  LoginTextFeild(
                    icon: Icons.lock,
                    hintText: 'Password',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Password';
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HospitalView()));
                      }
                    },
                    child: Text(
                      'Login',
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Forget Password?',
                          style: TextStyle(color: Colors.blue)))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool phonenovalid(String phoneno) {
    return RegExp('^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}\$')
        .hasMatch(phoneno);
  }
}
