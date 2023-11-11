import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/pages/add_assistant_page.dart';
import 'package:my_doctor/pages/settings_page.dart';

class ManageAssistantPage extends StatefulWidget {
  const ManageAssistantPage({super.key});

  @override
  State<ManageAssistantPage> createState() => _ManageAssistantPageState();
}

class _ManageAssistantPageState extends State<ManageAssistantPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: ()async{
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SettingsPage()),
      );
      return false;
    },
      child: Scaffold(
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
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SettingsPage()),
              );
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 35,
            ),
          ),
          title: Text(
            "Manage Assistants",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, color: Colors.white),
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
              size: 55,
            ),
            backgroundColor: Color(0xff1468B3),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddAssistantPage()),
              );
            },
          ),
        ),
      ),
    );
  }
}
