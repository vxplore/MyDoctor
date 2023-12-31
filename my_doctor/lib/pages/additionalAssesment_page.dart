import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/custom%20widget/button.dart';
import 'package:my_doctor/pages/patient_complaints_page.dart';
import 'package:my_doctor/pages/patient_lookUp_page.dart';
import 'package:my_doctor/pages/prescription_webview_page.dart';

import '../custom widget/showPatientLookUpDialog.dart';
import '../service/navigation_service.dart';
import 'inner page/diagnosis_page.dart';
import 'inner page/findings_page.dart';
import 'inner page/investigation_page.dart';

class AdditionalAssesmentPage extends StatefulWidget {
  const AdditionalAssesmentPage({super.key});

  @override
  State<AdditionalAssesmentPage> createState() =>
      _AdditionalAssesmentPageState();
}

class _AdditionalAssesmentPageState extends State<AdditionalAssesmentPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        NavigationService().navigateToScreen(PatientComplaintsPage());
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: Color(0xff1468B3),
          toolbarHeight: 80,
          leadingWidth: 30,
          leading: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 35,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "More Info",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Color(0xffDCDCDC)),
              ),
              Text(
                "Additional Assessment",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 21),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PatientLookUppage()),
                  );
                },
                child: Icon(
                  Icons.content_paste,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Container(
            height: 740,
            width: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 640,
                  width: 500,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            NavigationService()
                                .navigateToScreen(FindingsPage());
                          },
                          child: Container(
                            height: 90,
                            child: Card(
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                              elevation: 5,
                              child: Container(
                                padding: EdgeInsets.only(left: 14, right: 7),
                                height: 80,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.youtube_searched_for,
                                      color: Color(0xff33cccc),
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Findings",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Color(0xff545454)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            NavigationService()
                                .navigateToScreen(InvestigationsPage());
                          },
                          child: Container(
                            height: 90,
                            child: Card(
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                              elevation: 5,
                              child: Container(
                                padding: EdgeInsets.only(left: 14, right: 7),
                                height: 80,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.article,
                                      color: Colors.purple,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Investigation",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Color(0xff545454)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            NavigationService()
                                .navigateToScreen(DiagnosisPage());
                          },
                          child: Container(
                            height: 90,
                            child: Card(
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                              elevation: 5,
                              child: Container(
                                height: 80,
                                padding: EdgeInsets.only(left: 14, right: 7),
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.medication,
                                      color: Colors.orange,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Diagnosis",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Color(0xff545454)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 70,
                  width: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 70,
                        width: 180,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Color(0xff1468B3)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                padding: const EdgeInsets.all(12),
                                backgroundColor: Colors.white),
                            onPressed: () {},
                            child: Text(
                              "Save Draft",
                              style: TextStyle(
                                color: Color(0xff1468B3),
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                            )),
                      ),
                      Spacer(),
                      Container(
                        height: 70,
                        width: 180,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                padding: const EdgeInsets.all(12),
                                backgroundColor: Color(0xff1468B3)),
                            onPressed: () {
                              /*showDialog(
                                  context: context,
                                  builder: (context) =>
                                      ShowPatientLookUpDialog(),
                                  barrierDismissible: false);*/
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PrescriptionWebViewPage()),
                              );
                            },
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20),
                            )),
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
