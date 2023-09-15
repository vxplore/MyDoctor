import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/pages/addPatient_page.dart';
import 'package:my_doctor/pages/patient_prescription_page.dart';
import 'package:my_doctor/service/navigation_service.dart';

class MyPatientPage extends StatefulWidget {
  const MyPatientPage({super.key});

  @override
  State<MyPatientPage> createState() => _MyPatientPageState();
}

class _MyPatientPageState extends State<MyPatientPage> {
  List patientimage = [
    "assets/images/instadoclogo.png",
    "assets/images/instadoclogo.png"
  ];
  List patientName = ["Nitish Kumar", "Ekta Kumari"];
  List patientAge = ["26", "24"];
  List patientGender = ["Male", "Female"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3FBFF),
      appBar: AppBar(
        backgroundColor: Color(0xff1468B3),
        toolbarHeight: 85,
        leading: Padding(
          padding: const EdgeInsets.only(left: 17),
          child: InkWell(
            onTap: () {},
            child: Icon(
              Icons.keyboard_backspace,
              color: Color(0xff41CFD9),
              size: 50,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 21),
            child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 50,
                )),
          ),
        ],
        title: Text(
          "My Patients",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.normal,
              color: Color(0xffD9D9D9)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 17),
        child: Container(
          height: 740,
          width: 500,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: patientName.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    NavigationService()
                        .navigateToScreen(PatientPrescriptionPage());
                  },
                  child: Container(
                    height: 120,
                    width: 500,
                    child: Column(
                      children: [
                        Card(
                          elevation: 0,
                          color: Color(0xffF3FBFF),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                maxRadius: 45,
                                child: Image.asset(
                                  patientimage[index],
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      patientName[index],
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${patientAge[index]} Years -",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xffAEAEAE)),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          patientGender[index],
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xffAEAEAE)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        new Divider(
                          color: Color(0xffE6E6E6),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        // isExtended: true,
        child: Icon(Icons.add),
        backgroundColor: Color(0xffCFCFCF),
        onPressed: () {
          NavigationService().navigateToScreen(AddPatientPage());
        },
      ),
    );
  }
}
