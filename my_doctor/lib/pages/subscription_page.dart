import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../service/global_variables.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1468B3),
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            /* Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PatientPrescriptionPage(
                      globalVariables.patientName!,
                      globalVariables.patientAge!,
                      globalVariables.patientAgeType!,
                      globalVariables.patientsGender!,
                      globalVariables.patientImg!)),
            );*/
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 35,
          ),
        ),
        title: Text(
          "Subscription",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                maxRadius: 55,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    // "assets/images/instadoclogo.png",
                    globalVariables.getDoctorDetails!.doctor.profileImage,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "My Account",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              "${globalVariables.getDoctorDetails!.doctor.phineNo}",
              style: TextStyle(fontSize: 25, color: Colors.grey),
            ),
            SizedBox(
              height: 25,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "MEMBERSHIP",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Container(
                      width: 500,
                      child: Card(
                        color: Colors.white,
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "ePrescrip Trial",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Next Billing DATE: 15th November 2023",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Upgrade Membership",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
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
            ),
            SizedBox(
              height: 25,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ACCOUNT & SECURITY",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Container(
                      width: 500,
                      child: Card(
                        color: Colors.white,
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Log Out",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Log Out All Devices",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
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
            ),
          ],
        ),
      ),
    );
  }
}
