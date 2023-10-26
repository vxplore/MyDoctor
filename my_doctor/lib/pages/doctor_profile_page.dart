import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/pages/dashboardPage.dart';
import 'package:my_doctor/service/navigation_service.dart';

import '../service/global_variables.dart';
import 'doctor_profile_edit_page.dart';
import 'main_dashboard_page.dart';

class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage({super.key});

  @override
  State<DoctorProfilePage> createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          NavigationService().navigateToScreen(MainDashboardPage());
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.red,
          body:
          SingleChildScrollView(
            // padding: EdgeInsets.only(left: 28,right: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: 1.sw,
                  color: Colors.red,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 50,
                        width: 1.sw,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                NavigationService()
                                    .navigateToScreen(MainDashboardPage());
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {

                                NavigationService()
                                    .navigateToScreen(DoctorProfileEditPage());
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(alignment: Alignment.center,
                                    child: Icon(
                                      Icons.edit_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  Text(
                                    "EDIT",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 100,
                        width: 1.sw,
                        // color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              height: 80,
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${globalVariables.getDoctorDetails!.doctor.name[0]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 120,
                              width: 250,
                              margin: EdgeInsets.only(top: 20),
                              /* decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20))),*/
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dr.${globalVariables.getDoctorDetails!.doctor.name}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Dentist",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 650,
                  width: 1.sw,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        height: 75,
                        width: 1.sw,
                        child: Row(
                          children: [
                            Icon(
                              Icons.school,
                              size: 30,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Qualification,Degrees,Experience",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        height: 25,
                        width: 1.sw,
                        child: Row(
                          children: [
                            Icon(
                              Icons.badge,
                              size: 30,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Other Specialization",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Row(
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
                                  fontSize:16,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 1.sw,
                        color: Colors.white,
                        padding: EdgeInsets.only(left: 25, right: 25),
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
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Row(
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
                      ),
                      Container(
                        height: 150,
                        width: 1.sw,
                        color: Colors.white,
                        padding: EdgeInsets.only(left: 25, right: 25),
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
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(border: Border.all(color:Color(0xff1468B3)),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20))),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "VIEW AS\nPATIENT",
                                  style: TextStyle(
                                      color: Color(0xff1468B3),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20))),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "SHARE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
