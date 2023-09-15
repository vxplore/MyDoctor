import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorPracticePage extends StatefulWidget {
  const DoctorPracticePage({super.key});

  @override
  State<DoctorPracticePage> createState() => _DoctorPracticePageState();
}

class _DoctorPracticePageState extends State<DoctorPracticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/videocall.png",
                  height: 40,
                  width: 40,
                ),
                Text(
                  "For Online Appointments",
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Container(
              height: 150,
              width: 1.sw,
              color: Colors.white,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Card(
                elevation: 5,
                color: Colors.white,
                child: Container(
                  height: 150,
                  width: 1.sw,
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Setup Video Consultation?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20))),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "SETUP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Treating your patient in the comfort of their home has never been this easy !",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Image.asset(
                  "assets/images/building.png",
                  height: 40,
                  width: 40,
                ),
                Text(
                  "Clinic(s) For In Person Appointments",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Container(
              height: 160,
              width: 1.sw,
              color: Colors.white,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Card(
                elevation: 5,
                color: Colors.white,
                child: Container(
                  height: 150,
                  width: 1.sw,
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Let's add a Clinic?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20))),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "ADD",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Activate booking of appointments for patients with IVR and your online profile",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
