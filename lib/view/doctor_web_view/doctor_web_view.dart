import 'package:cgg_base_project/view/hospital_web_view/hospital_web_view.dart';
import 'package:flutter/material.dart';
import '../doctor_web_details/doctor_web_details.dart';

class DoctorWebView extends StatelessWidget {
  final List dummyList = List.generate(10, (index) {
    return {
      // "id": Image.asset(
      //   'assets/doctor.png',
      //   // color: Color.fromRGBO(15, 148, 220,1),
      // ),
      "title": "Doctor Details",
      "subtitle": "Name Details ",
    };
  });

  DoctorWebView({Key? key}) : super(key: key);
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
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HospitalView()));
                },
                child: Image.asset('assets/view_hospital.png'),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DoctorAddDetails()));
                },
                child: Image.asset('assets/view_doctor.png'),
              ),
              SizedBox(height: 10,),
              Text('View Doctors', style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 200,),
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
                    Text('Doctor View', style: TextStyle(fontSize: 25),),
                    Padding(padding:EdgeInsets.only(left: 70,right:500,top: 10 ,bottom: 10)),
                    Image.asset('assets/search2.png'),
                    Padding(padding: EdgeInsets.all(50)),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoctorAddDetails()));
                      },
                      child:Text('+ Add Doctor'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: TextStyle(
                    fontSize: 10,
                  ),
                ),
                    ),
                    SizedBox(height: 20,width: 20,),
                    Image.asset('assets/user2.png'),
                    SizedBox(height: 20,width: 5,),
                    Text('User Name', style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              Text('Doctors List ',textAlign:TextAlign.left,style: TextStyle(fontSize: 10),),
              Container(
                height: MediaQuery.of(context).size.height - 100,
                width: MediaQuery.of(context).size.width - 150,
                // color: Color.fromRGBO(0, 0, 0, 0.09),
                // alignment: Alignment.topLeft,
                padding: EdgeInsets.all(25),
                child: ListView.builder(
                  itemCount: dummyList.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 4,
                    margin: EdgeInsets.only(top: 26,left: 200,right: 250,),
                    child: ListTile(
                        leading:Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffFFFFFF),width: 3),
                            color: Color.fromRGBO(15, 148, 220, 1),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                            child:   Image.asset('assets/doctor.png',color: Colors.white,),
                          ),
                        ),


                      title: Text(dummyList[index]["title"]),
                      subtitle: Text(dummyList[index]["subtitle"]),
                      //trailing: const Icon(Icons.add_a_photo),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
