import 'package:cgg_base_project/view/doctor_web_view/doctor_web_view.dart';
import 'package:flutter/material.dart';
import '../hospital_details/hospital_details.dart';
class HospitalView extends StatelessWidget {
  final List dummyList = List.generate(10, (index) {
    return {
      "title": "Hospitail Details",
      "subtitle": "Name\n Details ",
    };
  });

  HospitalView({Key? key}) : super(key: key);
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
              Padding(padding:EdgeInsets.only(top:34 ,right: 33,left: 33)),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HospitalView()));
                },
                child: Image.asset('assets/icons/home.png',width:137,
                  ),
              ),
              SizedBox(height: 30,width: 20,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorWebView()));
                },
                child: Image.asset('assets/view_doctor.png', height: 20, width: 10,
                ),
              ),
              SizedBox(height: 10,),
              Text('View Doctors', style: TextStyle(color: Colors.white),),
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
                height:75,
                width: MediaQuery.of(context).size.width - 150,
                alignment: Alignment.topLeft,
                color: Color.fromRGBO(19, 151, 219, 0.06),
                padding: EdgeInsets.all(25),
                child: Row(
                  children: [
                    Text('Hospitals View', style: TextStyle(fontSize: 25),),
                    Padding(padding: EdgeInsets.all(80)),
                    Icon(Icons.search ),
                    Padding(padding: EdgeInsets.all(50)),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalDetails()));
                      },
                      child: Image.asset('assets/add_hospitals.png',),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Image.asset('assets/user2.png'),
                    Padding(padding: EdgeInsets.all(5)),
                    Text('User Name', style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              Text('Hospitals List ', textAlign:TextAlign.left,
                  style: TextStyle(fontSize: 30),),
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - 100,
                  width: MediaQuery.of(context).size.width - 150,
                  // color: Color.fromRGBO(0, 0, 0, 0.09),
                  // alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(25),
                  child: ListView.builder(
                    itemCount: dummyList.length,
                    itemBuilder: (context, index) => Card(
                      elevation: 4,
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        leading:Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffFFFFFF),width: 3),
                            color: Color.fromRGBO(15, 148, 220, 1),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 6),
                            child: Text('Hospital\nLogo',textAlign:TextAlign.center,style:
                            TextStyle(color: Colors.white,fontSize:8  ),),
                          ),
                        ),

                        title: Text(dummyList[index]["title"]),
                        subtitle: Text(dummyList[index]["subtitle"]),
                        //trailing: const Icon(Icons.add_a_photo),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
