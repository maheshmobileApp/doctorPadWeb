import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../doctor_web_view/doctor_web_view.dart';
import '../hospital_web_view/hospital_web_view.dart';

class AddDoctorSuccessfully extends StatelessWidget {
  const AddDoctorSuccessfully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SingleChildScrollView(
          child: Container(
            width: 120,
            height: 1080,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Image.asset('assets/doctpad.png'),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HospitalView()));
                  },
                  child: Image.asset('assets/view_hospital.png'),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DoctorWebView()));
                  },
                  child: Image.asset('assets/view_doctor.png'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Add Doctors',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 400,
                ),
                Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(height: 10,),
                Text('Logout', style: TextStyle(color: Colors.white),),
              ],
            ),
            color: Color.fromRGBO(15, 148, 220, 1),
          ),
        ),
        Column(
          children: [
            Container(
              height: 75,
              width: MediaQuery.of(context).size.width - 150,
              alignment: Alignment.topLeft,
              color: Color.fromRGBO(19, 151, 219, 0.06),
              padding: EdgeInsets.all(25),
              child: Row(
                children: [
                  Text(
                    'Add Doctors',
                    style: TextStyle(fontSize: 25),
                  ),
                  Padding(padding: EdgeInsets.all(80)),
                  Image.asset('assets/search2.png'),
                  Padding(padding: EdgeInsets.all(50)),
                  Image.asset('assets/user2.png'),
                  Padding(padding: EdgeInsets.all(5)),
                  Text(
                    'User Name',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 500,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/successfully.png'),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    'Add Doctor Successfully',
                    style: TextStyle(fontSize: 25, color: Color(0xff1397DB)),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DoctorWebView()));
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(fontSize: 25, color: Color(0xffFFFFFF)),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Color(0xff1397DB),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
