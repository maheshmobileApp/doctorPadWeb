import 'package:flutter/material.dart';

class HospitalView extends StatelessWidget {
  final List dummyList = List.generate(10, (index) {
    return {
      // "id": Image.asset('assets/hospital_logo.png',
      // color: Color.fromRGBO(15, 148, 220,1),
      // ),
      "title": "Hospitail Details",
      "subtitle": "Name Details ",
    };
  });

  HospitalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                    'Hospitals View',
                    style: TextStyle(fontSize: 25),
                  ),
                  Padding(padding: EdgeInsets.all(80)),
                  Image.asset('assets/search2.png'),
                  Padding(padding: EdgeInsets.all(50)),
                  Image.asset(
                    'assets/add_hospitals.png',
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Image.asset('assets/user2.png'),
                  Padding(padding: EdgeInsets.all(5)),
                  Text(
                    'User Name',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width - 150,
              color: Color.fromRGBO(0, 0, 0, 0.09),
              // alignment: Alignment.topLeft,
              padding: EdgeInsets.all(25),
              child: ListView.builder(
                itemCount: dummyList.length,
                itemBuilder: (context, index) => Card(
                  elevation: 6,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    // leading: Image.asset(dummyList[index]["id"].toString()),

                    // child: Text(dummyList[index]["id"].toString()),

                    title: Text(dummyList[index]["title"]),
                    subtitle: Text(dummyList[index]["subtitle"]),
                    //trailing: const Icon(Icons.add_a_photo),
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
