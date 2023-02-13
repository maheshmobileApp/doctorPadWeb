import 'package:flutter/material.dart';
import '../../res/components/text_field/text_field.dart';
import '../doctor_web_view/doctor_web_view.dart';
import '../hospital_web_view/hospital_web_view.dart';

class DoctorDetails extends StatelessWidget {
  const DoctorDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
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
                'View Doctors',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 400,
              ),
              Icon(Icons.logout_outlined, color: Colors.white, size: 40,),
              SizedBox(height: 10,),
              Text('Logout', style: TextStyle(color: Colors.white),),
            ],
          ),
          color: Color.fromRGBO(15, 148, 220, 1),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 75,
                width: MediaQuery.of(context).size.width - 150,
                alignment: Alignment.topLeft,
                color: Color.fromRGBO(19, 151, 219, 0.06),
                padding: EdgeInsets.all(25),
                child: Row(
                  children: [
                    Text('Add Doctors', style: TextStyle(fontSize: 25),),
                    Padding(padding: EdgeInsets.all(80)),
                    Image.asset('assets/search2.png'),
                    Padding(padding: EdgeInsets.all(50)),
                    Image.asset('assets/user2.png'),
                    Padding(padding: EdgeInsets.all(5)),
                    Text('User Name', style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 500,
                //height: MediaQuery.of(context).size.height - 100,
                width: 300,
                decoration: BoxDecoration(
                    color:Color.fromRGBO(15, 148, 220, 1), borderRadius: BorderRadius.circular(16)),
                // alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    TextFeild(
                      icon: Icons.home,
                      hintText: 'Name Of The Doctor',
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    TextFeild(
                      icon: Icons.lock,
                      hintText: 'Doctor Registration Number',
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    TextFeild(
                      icon: Icons.call,
                      hintText: "Mobile Number",
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    TextFeild(
                      icon: Icons.lock,
                      hintText: 'Doctor Speciality',
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    TextFeild(
                      icon: Icons.lock,
                      hintText: 'Clinic Speciality',
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    TextFeild(
                      icon: Icons.email,
                      hintText: 'Email id',
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HospitalView()));
                      },
                      child: Text(
                        'Back',
                        style: TextStyle(color: Color(0xff0093E9)),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: Color(0xffFFFFFF),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        textStyle: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
