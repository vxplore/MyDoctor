import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/custom%20widget/custom_circularProgress.dart';
import 'package:my_doctor/pages/myPatient_page.dart';
import 'package:my_doctor/pages/patient_complaints_page.dart';
import 'package:my_doctor/pages/updatePatient_page.dart';
import 'package:my_doctor/service/global_variables.dart';
import 'package:my_doctor/view_models/patient_prescription_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/utilites/getPatientDetails_response_data.dart';
import '../service/navigation_service.dart';
import 'addPatient_page.dart';
import 'main_dashboard_page.dart';

class PatientPrescriptionPage extends StatefulWidget {


  PatientPrescriptionPage(
      {super.key});

  @override
  State<PatientPrescriptionPage> createState() =>
      _PatientPrescriptionPageState();
}

class _PatientPrescriptionPageState extends State<PatientPrescriptionPage> {
  var vm = PatientPrescriptionViewModel();
  GetpatientdetailsResponseData? patientDetails;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) async {
      if(timer.tick == 1){
        timer.cancel();
        patientDetails = await vm.getPatientDetails();
        Future.delayed(Duration(seconds: 1));
        setState(() {
          globalVariables.patientEmails =   patientDetails!.patient.email;
          globalVariables.patientPhNumber =   patientDetails!.patient.phoneNo;
          globalVariables
              .patientAgeTypeprefil =
              patientDetails!.patient.ageType;
          globalVariables.patientName =
              patientDetails!.patient.name;
          globalVariables.patientAge =
              patientDetails!.patient.age;
          globalVariables.patientAgeType =
              patientDetails!.patient.ageType;
          globalVariables.patientsGender =
              patientDetails!.patient.gender;
          globalVariables.patientImg =
              patientDetails!.patient
                  .profileImage;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          globalVariables.patientsGender = null;
          globalVariables.patientAgeType = "";
          globalVariables.patientGender = "";
          globalVariables.profileImagePath = "";
          globalVariables.ageController.text = "";
          globalVariables.dropdownvalue = "Years";
          globalVariables.selectedDisease = [];
          globalVariables.selectedAllergy = [];
          globalVariables.selectedHabits = [];
        });
        NavigationService().replaceScreen(MyPatientPage());
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xffF3FBFF),
        appBar: AppBar(
          backgroundColor: Color(0xff1468B3),
          toolbarHeight: 135,
          leading: InkWell(
            onTap: () {
              setState(() {
                globalVariables.patientsGender = null;
                globalVariables.patientAgeType = "";
                globalVariables.patientGender = "";
                globalVariables.profileImagePath = "";
                globalVariables.ageController.text = "";
                globalVariables.dropdownvalue = "Years";
                globalVariables.selectedDisease = [];
                globalVariables.selectedAllergy = [];
                globalVariables.selectedHabits = [];
              });
              NavigationService().replaceScreen(MyPatientPage());
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 50,
            ),
          ),
          leadingWidth: 30,
          title: patientDetails == null ?Container(height: 0,width: 0,): Row(
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          // "assets/images/instadoclogo.png",
                          // widget.image,
                          patientDetails!.patient.profileImage,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                        ),
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
                      // "Nitish Kumar",
                      // "${widget.name}",
                      "${patientDetails!.patient.name}",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    Row(
                      children: [
                        Text(
                          // "26 Years -",
                          // "${widget.age} ${widget.ageType} -",
                          "${patientDetails!.patient.age} ${patientDetails!.patient.ageType} -",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          // "Male",
                          // "${widget.gender}",
                          "${patientDetails!.patient.gender}",
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
            InkWell(
              onTap: () {
                print("patient id :: ${globalVariables.patientId}");
              },
              child: Icon(
                Icons.receipt_long,
                color: Colors.white,
                size: 28,
              ),
            ),
            InkWell(
                onTap: () {
                  // Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 65,
                                ),
                                Card(
                                  child: Container(
                                    // height: 90,
                                    width: 200,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 150,
                                            child: GestureDetector(
                                              onTap: () {
                                                print("chg");
                                                /* NavigationService()
                                                    .navigateToScreen(
                                                    DoctorBankDetailsPage());*/
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: GestureDetector(onTap: (){
                                                  setState(() {

                                                  });
                                                  NavigationService().navigateToScreen(UpdatePatientPage());
                                                },
                                                  child: Text(
                                                    "Edit",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 150,
                                            child: GestureDetector(
                                              onTap: () async {
                                                final Uri url = Uri(
                                                    scheme: "tel",
                                                    path: "18888888818");
                                                if (await canLaunchUrl(url)) {
                                                  await launchUrl(url);
                                                } else {
                                                  print("cannot start calling");
                                                }
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Refer",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 150,
                                            child: GestureDetector(
                                              onTap: () async {
                                                final Uri url = Uri(
                                                    scheme: "tel",
                                                    path: "18888888818");
                                                if (await canLaunchUrl(url)) {
                                                  await launchUrl(url);
                                                } else {
                                                  print("cannot start calling");
                                                }
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // width: 150,
                                            child: GestureDetector(
                                              onTap: () async {
                                                final Uri url = Uri(
                                                    scheme: "tel",
                                                    path: "18888888818");
                                                if (await canLaunchUrl(url)) {
                                                  await launchUrl(url);
                                                } else {
                                                  print("cannot start calling");
                                                }
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Send Payment Link",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // width: 150,
                                            child: GestureDetector(
                                              onTap: () async {
                                                final Uri url = Uri(
                                                    scheme: "tel",
                                                    path: "18888888818");
                                                if (await canLaunchUrl(url)) {
                                                  await launchUrl(url);
                                                } else {
                                                  print("cannot start calling");
                                                }
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Send SMS",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // width: 150,
                                            child: GestureDetector(
                                              onTap: () async {
                                                final Uri url = Uri(
                                                    scheme: "tel",
                                                    path: "18888888818");
                                                if (await canLaunchUrl(url)) {
                                                  await launchUrl(url);
                                                } else {
                                                  print("cannot start calling");
                                                }
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Make a phone call",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // width: 150,
                                            child: GestureDetector(
                                              onTap: () async {
                                                final Uri whatsapp = Uri.parse(
                                                    "https://wa.me/18888888818");
                                                launchUrl(whatsapp);
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Send Whatsapp",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ),
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
                      },
                      barrierDismissible: false);
                },
                child: Icon(
                  Icons.more_vert,
                  size: 50,
                  color: Colors.white,
                )),
          ],
        ),
        body:patientDetails == null ? MyCircularIndicator() : Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 83, right: 71),
            child: Text(
              // "Seems like you have no prescriptions for ${widget.name}",
              "Seems like you have no prescriptions for ${patientDetails!.patient.name}",
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
                MaterialPageRoute(
                    builder: (context) => PatientComplaintsPage()),
              );
            },
          ),
        ),
      ),
    );
  }
}
