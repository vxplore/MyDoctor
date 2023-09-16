import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/pages/followUpDate_page.dart';
import 'package:my_doctor/pages/recommandedLabTest_page.dart';

import '../pages/addMedication_page.dart';

class ShowPatientLookUpDialog extends StatefulWidget {
  const ShowPatientLookUpDialog({super.key});

  @override
  State<ShowPatientLookUpDialog> createState() =>
      _ShowPatientLookUpDialogState();
}

class _ShowPatientLookUpDialogState extends State<ShowPatientLookUpDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 700,
        width: 400,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: 350,
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 23),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.add_circle,
                            color: Colors.red,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddMedicationPage()),
                              );
                            },
                            child: Text(
                              "Add Medication",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xff787878)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 23),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.article,
                            color: Color(0xff33ACBF),
                          ),
                          Text(
                            "Add Notes",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, color: Color(0xff787878)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 23),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RecomandedLabTestPage()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.query_stats,
                              color: Color(0xff939393),
                            ),
                            Text(
                              "Recommend Lab Test",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xff787878)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 23),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FollowUpDatePage()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.event,
                              color: Color(0xff33ACBF),
                            ),
                            Text(
                              "Set Follow Up Date",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xff787878)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 23),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.textsms,
                            color: Color(0xff4E89B1),
                          ),
                          Text(
                            "Provide Advice",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, color: Color(0xff787878)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 23),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.medical_services, color: Colors.green),
                          Text(
                            "Add Clinic Logo",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, color: Color(0xff787878)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 23),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.brush,
                            color: Colors.blue,
                          ),
                          Text(
                            "Add Digital Signature",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, color: Color(0xff787878)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(80)),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close, color: Colors.black, size: 60),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Add Medication

Add Notes

Recommend Lab

Test Set

Follow Up

Date Provide

Advice Add

Clinic Logo

Add Digital
Signature*/
