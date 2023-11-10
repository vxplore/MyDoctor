import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/custom%20widget/button.dart';
import 'package:my_doctor/service/global_variables.dart';

import 'out_of_clinic_page.dart';

class OutOfClinicSelectClinicPage extends StatefulWidget {
  const OutOfClinicSelectClinicPage({super.key});

  @override
  State<OutOfClinicSelectClinicPage> createState() =>
      _OutOfClinicSelectClinicPageState();
}

class _OutOfClinicSelectClinicPageState
    extends State<OutOfClinicSelectClinicPage> {
  List<Map<String, dynamic>> clinics = [
    {"name": "fgh", "ID": "001"},
    {"name": "dfs", "ID": "002"},
    {"name": "qwef", "ID": "003"},
    {"name": "bvcmnf", "ID": "004"},
  ];
  List<Map<String, dynamic>> selectedClinics = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          globalVariables.selectedClinicNames = [];
          selectedClinics = [];
        });
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Clinic(s)/Hospital",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                "To setup Out of Clinic on",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ],
          ),
        ),
        body: Container(
          height: 780,
          width: 500,
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                height: 500,
                width: 500,
                child: ListView.builder(
                    itemCount: clinics.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CheckboxListTile(
                        title: Text("${clinics[index]["name"]}"),
                        value: selectedClinics.contains(clinics[index]),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value != null && value) {
                              selectedClinics.add(clinics[index]);
                              globalVariables.selectedClinicNames
                                  .add(clinics[index]["name"]);
                            } else {
                              selectedClinics.remove(clinics[index]);
                              globalVariables.selectedClinicNames
                                  .remove(clinics[index]["name"]);
                            }
                          });
                        },
                      );
                    }),
              ),
              Spacer(),
             /* InkWell(
                onTap: () {
                  print("$selectedClinics");
                  print("${globalVariables.selectedClinicNames}");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OutOfClinicPage()),
                  );
                },
                child: Container(
                  child: Text("DONE"),
                ),
              ),*/
              Container(
                margin: EdgeInsets.all(17),
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    print("$selectedClinics");
                    print("${globalVariables.selectedClinicNames}");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OutOfClinicPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff1468B3),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4))),
                  child: Text("Done"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
