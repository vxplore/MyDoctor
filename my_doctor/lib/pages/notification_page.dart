import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool isSwitched = false;
  var textValue = 'Disable';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Enable';
      });
      print('Enable');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Disable';
      });
      print('Disable');
    }
  }

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
          "Notification",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Receive Notification",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '$textValue',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                  Spacer(),
                  Switch(
                    onChanged: toggleSwitch,
                    value: isSwitched,
                    activeColor: Colors.blue,
                    activeTrackColor: Colors.blue.shade100,
                    inactiveThumbColor: Colors.red,
                    inactiveTrackColor: Colors.red.shade100,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
