import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginWebView extends StatelessWidget {
  LoginWebView({super.key});

  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  bool isAlredyUser = false;
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  //A function that validate user entered password
  bool validatePassword(String pass){
    String _password = pass.trim();
    if(pass_valid.hasMatch(_password)){
      return true;
    }else{
      return false;
    }
  }

  bool isValidPhoneNumber(String? phone) =>
      RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)')
          .hasMatch(phone ?? '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SingleChildScrollView(
        child:Container(
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
                key: _formKey,
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'User Mobile Number',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.blue,
                      )),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _formKey.currentState?.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter a Phone Number";
                    } else if (!RegExp(
                            r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                        .hasMatch(value)) {
                      return "Please Enter a Valid Phone Number";
                    }
                  },
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
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter password";
                  }else{
                    //call function to check password
                    bool result = validatePassword(value);
                    if(result){
                      // create account event
                      return null;
                    }else{
                      return " Password should contain Capital, small letter & Number & Special";
                    }
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );

                    if (isAlredyUser) {
                    } else {
                      isAlredyUser = true;
                    }
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
    );
  }
}
