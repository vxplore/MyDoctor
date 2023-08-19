import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/pages/patient_complaints_page.dart';

class PatientPrescriptionPage extends StatefulWidget {
  const PatientPrescriptionPage({super.key});

  @override
  State<PatientPrescriptionPage> createState() =>
      _PatientPrescriptionPageState();
}

class _PatientPrescriptionPageState extends State<PatientPrescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3FBFF),
      appBar: AppBar(
        backgroundColor: Color(0xff1468B3),
        toolbarHeight: 135,
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
          size: 50,
        ),
        leadingWidth: 30,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey)),
                  child: CircleAvatar(
                    maxRadius: 35,
                    child: Image.asset(
                      "assets/images/instadoclogo.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  padding: const EdgeInsets.all(0),
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      size: 10,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nitish Kumar",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                  Row(
                    children: [
                      Text(
                        "26 Years -",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Male",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Icon(
            Icons.receipt_long,
            color: Colors.white,
            size: 28,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 28,
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 83, right: 71),
          child: Text(
            "Seems like you have no prescriptions for Nitish Kumar",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Color(0xff9C9C9C)),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          shape: CircleBorder(),
          // isExtended: true,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 35,
          ),
          backgroundColor: Color(0xffCFCFCF),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PatientComplaintsPage()),
            );
          },
        ),
      ),
    );
  }
}
