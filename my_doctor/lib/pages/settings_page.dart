import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/pages/notification_page.dart';
import 'package:my_doctor/pages/subscription_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
          "Settings",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/out_of_clinic_icon.png",
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Out of Clinic",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                      Text(
                        "Schedule the days when clinic is not conducted",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/notifications2_icon.png",
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Notifications",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                        Text(
                          "In-app notifications are Enabled",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/assistant_icon.png",
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Manage Assistants",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                      Text(
                        "Manage your Assistant's & their roles",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubscriptionPage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/instadoclogo.png",
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Manage Subscription",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                        Text(
                          "Manage Subscription",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                        ),
                      ],
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
