import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../doctor_web_view/doctor_web_view.dart';
class LoginWebView extends StatelessWidget {
  LoginWebView({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 76, 110, 1),
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 400,
              width: 450,
              color: Colors.white,
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
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'User Mobile Number',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter Mobile Number';
                      }else if(!phonenovalid(value)){
                        return 'Enter Valid Mobile Number';
                      }
                    }
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIconColor: Colors.blue,
                        prefixIcon: Icon(Icons.lock)
                    ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Password';
                        }
                      }
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>DoctorWebView()));
                      }
                    },
                    child: Text(
                      'Login',
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
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
