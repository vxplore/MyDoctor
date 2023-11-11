import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_doctor/pages/out_of_clinic_clinic_select_page.dart';
import 'package:my_doctor/pages/settings_page.dart';
import 'package:my_doctor/service/global_variables.dart';

class OutOfClinicPage extends StatefulWidget {
  const OutOfClinicPage({super.key});

  @override
  State<OutOfClinicPage> createState() => _OutOfClinicPageState();
}

class _OutOfClinicPageState extends State<OutOfClinicPage> {
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

  DateTime selectedDateFrom = DateTime.now();
  DateTime selectedDateTo = DateTime.now();
  TimeOfDay? selectedTimeFrom = TimeOfDay.now();

  TimeOfDay? selectedTimeTo = TimeOfDay.now();
  String selectedDateFromStr = "Select";
  String selectedDateToStr = "Select";
  String selectedTimeFromStr = "Select";
  String selectedTimeToStr = "Select";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          globalVariables.selectedAssistantRoleNames = "";
          globalVariables.selectedClinicNames = [];
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Out of Clinic",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          leading: InkWell(
            onTap: () {
              setState(() {
                globalVariables.selectedAssistantRoleNames = "";
                globalVariables.selectedClinicNames = [];
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
            child: Image.asset(
              "assets/images/cross_icon.png",
            ),
          ),
          actions: [
            InkWell(onTap: (){
              setState(() {
                globalVariables.selectedAssistantRoleNames = "";
                globalVariables.selectedClinicNames = [];
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
              child: Image.asset(
                "assets/images/done2_icon.png",
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OutOfClinicSelectClinicPage()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/clinic_icon.png",
                          height: 60,
                          width: 60,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Clinic and Hospital",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          Container(
                            width: 290,
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 200,
                                  child: globalVariables
                                              .selectedClinicNames.isEmpty ==
                                          true
                                      ? Text("Select",
                                          style: TextStyle(
                                              fontSize: 17, color: Colors.grey))
                                      : ListView.builder(
                                          itemCount: globalVariables
                                              .selectedClinicNames.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                  "${globalVariables.selectedClinicNames[index]}",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.grey)),
                                            );
                                          }),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/calendar_icon.png",
                        height: 60,
                        width: 60,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 290,
                          child: Row(
                            children: [
                              Text(
                                "From",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.grey),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () async {
                                  final DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: selectedDateFrom,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2101));
                                  if (picked != null &&
                                      picked != selectedDateFrom) {
                                    setState(() {
                                      selectedDateFrom = picked;
                                      selectedDateFromStr = DateFormat.yMMMd()
                                          .format(selectedDateFrom);
                                    });
                                  }
                                },
                                child: Text("${selectedDateFromStr}",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.grey)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 290,
                          child: Row(
                            children: [
                              Text(
                                "To",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.grey),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () async {
                                  final DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: selectedDateFrom,
                                      firstDate: selectedDateFrom,
                                      lastDate: DateTime(2101));
                                  if (picked != null &&
                                      picked != selectedDateTo) {
                                    setState(() {
                                      selectedDateTo = picked;
                                      selectedDateToStr = DateFormat.yMMMd()
                                          .format(selectedDateTo);
                                    });
                                  }
                                },
                                child: Text("${selectedDateToStr}",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.grey)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/time_icon.png",
                        height: 60,
                        width: 60,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: isSwitched == true ? 0 : 20,
                        ),
                        Container(
                          width: 290,
                          child: Row(
                            children: [
                              Text(
                                "All Day",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
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
                        ),
                        isSwitched == true
                            ? Container(
                                height: 0,
                                width: 0,
                              )
                            : Container(
                                width: 290,
                                child: Row(
                                  children: [
                                    Text(
                                      "From",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.grey),
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () async {
                                        final TimeOfDay? time =
                                            await showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now());
                                        if (time != null) {
                                          setState(() {
                                            selectedTimeFromStr =
                                                time.format(context);
                                          });
                                        }
                                      },
                                      child: Text("${selectedTimeFromStr}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey)),
                                    ),
                                  ],
                                ),
                              ),
                        isSwitched == true
                            ? Container(
                                height: 0,
                                width: 0,
                              )
                            : Container(
                                width: 290,
                                child: Row(
                                  children: [
                                    Text(
                                      "To",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.grey),
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () async {
                                        final TimeOfDay? time =
                                            await showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now());
                                        if (time != null) {
                                          setState(() {
                                            selectedTimeToStr =
                                                time.format(context);
                                          });
                                        }
                                      },
                                      child: Text("${selectedTimeToStr}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey)),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
