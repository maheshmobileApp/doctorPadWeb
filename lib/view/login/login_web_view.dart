import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginWebView extends StatelessWidget {
  LoginWebView({super.key});
  TextEditingController _emailController =
  TextEditingController(text: "SURESH_Mobile");
  TextEditingController _passwordController =
  TextEditingController(text: "SDREU@2022");

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 76, 110, 1),
      body: Center(
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
                Form(
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'User Mobile Number',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIconColor: Colors.blue,
                      prefixIcon: Icon(Icons.lock)),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {},
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
    );
  }
}
