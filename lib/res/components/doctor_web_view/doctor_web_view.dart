import 'package:flutter/material.dart';
class DoctorWebDetails extends StatelessWidget {
  const DoctorWebDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  Image.asset('assets/doctpad.png'),
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset('assets/view_hospital.png'),
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset('assets/view_doctor.png'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'View Doctors',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                    size: 40,
                  )
                ],
              ),
              color: Color.fromRGBO(15, 148, 220, 1),
            ),
            Column(
              children: [
                Container(
                  height: 100,
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
                SizedBox(height: 20,),
                Container(
                  height: 500,
                  //height: MediaQuery.of(context).size.height - 100,
                  width:500,
                  color: Color.fromRGBO(15, 148,220, 1),
                  // alignment: Alignment.topLeft,
                  child: Form(
                    child: TextFormField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          labelText: 'Name Of The Doctor',
                          prefixIcon: Icon(Icons.home)
                      ),
                      keyboardType: TextInputType.name,
                    ),

                  ),
                ),
              ],
            )
          ]),
    );
  }
}

