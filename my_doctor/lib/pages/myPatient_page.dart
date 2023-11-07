import 'dart:async';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/core/utilites/getAllPatients_response_data.dart';
import 'package:my_doctor/pages/addPatient_page.dart';
import 'package:my_doctor/pages/main_dashboard_page.dart';
import 'package:my_doctor/pages/patient_prescription_page.dart';
import 'package:my_doctor/service/global_variables.dart';
import 'package:my_doctor/service/navigation_service.dart';
import 'package:my_doctor/view_models/myPatient_view_model.dart';

import '../custom widget/custom_circularProgress.dart';

class MyPatientPage extends StatefulWidget {
  const MyPatientPage({super.key});

  @override
  State<MyPatientPage> createState() => _MyPatientPageState();
}

class _MyPatientPageState extends State<MyPatientPage> {
  /*List patientimage = [
    "assets/images/instadoclogo.png",
    "assets/images/instadoclogo.png"
  ];
  List patientName = ["Nitish Kumar", "Ekta Kumari"];
  List patientAge = ["26", "24"];
  List patientGender = ["Male", "Female"];*/
  final vm = MyPatientViewModel();
  List<Patient> _foundUsers = [];
  late TextEditingController _searchController;

  @override
  void initState() {
    // TODO: implement initState
    _searchController = TextEditingController();
    super.initState();
    Timer.periodic(
      Duration(seconds: 1),
      (timer) async {
        if (timer.tick == 1) {
          globalVariables.getAllPatients = await vm.getAllPatient();
          /*await Future.delayed(Duration(seconds: 1));
          setState(
            () {
              globalVariables.getAllPatients =
                  globalVariables.getAllPatientsFromApi;
            },
          );*/
        }
      },
    );
  }

  void _runFilter(String enteredKeyword) {
    List<Patient> results = [];
    if (enteredKeyword.isEmpty) {
      // results = _allUsers;
    } else {
      results = globalVariables.getAllPatients!.patients
          .where((user) =>
              user.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        NavigationService().replaceScreen(MainDashboardPage());
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF3FBFF),
        appBar: AppBar(
          backgroundColor: Color(0xff1468B3),
          toolbarHeight: 85,
          leading: Padding(
            padding: const EdgeInsets.only(left: 17),
            child: InkWell(
              onTap: () {
                NavigationService().replaceScreen(MainDashboardPage());
              },
              child: Icon(
                Icons.keyboard_backspace,
                color: Color(0xff41CFD9),
                size: 50,
              ),
            ),
          ),
          /*  actions: [
            Padding(
              padding: const EdgeInsets.only(right: 21),
              child: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 50,
                  )),
            ),
          ],*/
          title: Text(
            "My Patients",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                color: Color(0xffD9D9D9)),
          ),
        ),
        body: globalVariables.getAllPatients == null
            ? MyCircularIndicator()
            : CustomRefreshIndicator(
                builder: MaterialIndicatorDelegate(
                  builder: (context, controller) {
                    return Icon(
                      Icons.ac_unit,
                      color: Colors.blue,
                      size: 30,
                    );
                  },
                ),
                onRefresh: () {
                  return Future.delayed(
                    Duration(seconds: 1),
                    () async {
                      globalVariables.getAllPatients = await vm.getAllPatient();
                      Future.delayed(Duration(seconds: 1));
                      setState(() {
                        globalVariables.getAllPatients =
                            globalVariables.getAllPatientsFromApi;
                      });
                      var snackdemo = SnackBar(
                        content: Text("Refreshed List"),
                        backgroundColor: Colors.green,
                        elevation: 10,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(5),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
                    },
                  );
                },
                child: globalVariables.getAllPatients!.patients.isEmpty == true
                    ? Center(
                        child: Text(
                            textAlign: TextAlign.center,
                            "You Have No patient yet!!!\n\nClick on + button to add patient"),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(left: 17),
                          child: Container(
                            height: 740,
                            width: 500,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0, right: 14, top: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color:
                                            Color(0xffDFD0D0), // Border color
                                        width: 0.5, // Border width
                                      ),
                                    ),
                                    // height: 70,
                                    width: 390,
                                    child: FocusScope(
                                      child: TextField(
                                        onChanged: (value) => _runFilter(value),
                                        controller: _searchController,
                                        scrollPadding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: 20.0, top: 15, bottom: 10),
                                          isDense: true,
                                          border: InputBorder.none,
                                          labelStyle: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xffBBBBBB)),
                                          labelText: 'Search for Patients',
                                          suffixIcon: _searchController.text ==
                                                  ""
                                              ? Icon(Icons.search,
                                                  color: Color(0xffDFDFDF),
                                                  size: 40)
                                              : InkWell(
                                                  onTap: () {
                                                    _searchController.clear();
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                  },
                                                  child: Icon(Icons.clear,
                                                      color: Color(0xffDFDFDF),
                                                      size: 40),
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                _searchController.text != ""
                                    ? Container(
                                        height: 195,
                                        width: 500,
                                        child: _foundUsers.isNotEmpty
                                            ? ListView.builder(
                                                itemCount: _foundUsers.length,
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      globalVariables
                                                              .patientName =
                                                          _foundUsers[index]
                                                              .name;
                                                      globalVariables
                                                              .patientAge =
                                                          _foundUsers[index]
                                                              .age;
                                                      globalVariables
                                                              .patientAgeType =
                                                          _foundUsers[index]
                                                              .ageType;
                                                      globalVariables
                                                              .patientsGender =
                                                          _foundUsers[index]
                                                              .gender;
                                                      globalVariables
                                                              .patientId =
                                                          _foundUsers[index]
                                                              .patientId;
                                                      globalVariables
                                                              .patientImg =
                                                          _foundUsers[index]
                                                              .profileImage;
                                                      NavigationService().navigateToScreen(
                                                          PatientPrescriptionPage(
                                                              _foundUsers[index]
                                                                  .name,
                                                              _foundUsers[index]
                                                                  .age,
                                                              _foundUsers[index]
                                                                  .ageType,
                                                              _foundUsers[index]
                                                                  .gender,
                                                              _foundUsers[index]
                                                                  .profileImage));
                                                    },
                                                    child: Container(
                                                      height: 90,
                                                      width: 500,
                                                      child: Column(
                                                        children: [
                                                          Card(
                                                            elevation: 0,
                                                            color: Color(
                                                                0xffF3FBFF),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                CircleAvatar(
                                                                  maxRadius: 30,
                                                                  child: /*globalVariables
                                                        .getAllPatients!
                                                        .data
                                                        .patients[index]
                                                        .profileImage == "" ?  Image.asset(
                                                      // patientimage[index],
                                                      "assets/images/instadoclogo.png",
                                                      fit: BoxFit.fill,
                                                    ):*/
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            70),
                                                                    child: Image
                                                                        .network(
                                                                      // patientimage[index],
                                                                      _foundUsers[
                                                                              index]
                                                                          .profileImage,
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          5.0),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        // patientName[index],
                                                                        _foundUsers[index]
                                                                            .name,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            color: Colors.black),
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            // "${patientAge[index]} Years -",
                                                                            "${_foundUsers[index].age} ${_foundUsers[index].ageType} -",
                                                                            style: TextStyle(
                                                                                fontSize: 10,
                                                                                fontWeight: FontWeight.normal,
                                                                                color: Color(0xffAEAEAE)),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),
                                                                          Text(
                                                                            // patientGender[index],
                                                                            _foundUsers[index].gender,
                                                                            style: TextStyle(
                                                                                fontSize: 10,
                                                                                fontWeight: FontWeight.normal,
                                                                                color: Color(0xffAEAEAE)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          new Divider(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              )
                                            : Align(
                                                alignment: Alignment.center,
                                                child: const Text(
                                                  'No Patient found',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      color: Colors.red),
                                                ),
                                              ),
                                      )
                                    : Container(
                                        height: 0,
                                        width: 0,
                                      ),
                                Padding(
                                  padding: EdgeInsets.only(left: 19, top: 25),
                                  child: Text(
                                    "Patients",
                                    style: TextStyle(
                                        fontSize: 24, color: Color(0xffC4C4C4)),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height:
                                      _searchController.text != "" ? 285 : 480,
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      physics: AlwaysScrollableScrollPhysics(),
                                      // itemCount: patientName.length,
                                      itemCount: globalVariables
                                          .getAllPatients!.patients.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                          onTap: () {
                                            globalVariables.patientName =
                                                globalVariables.getAllPatients!
                                                    .patients[index].name;
                                            globalVariables.patientAge =
                                                globalVariables.getAllPatients!
                                                    .patients[index].age;
                                            globalVariables.patientAgeType =
                                                globalVariables.getAllPatients!
                                                    .patients[index].ageType;
                                            globalVariables.patientsGender =
                                                globalVariables.getAllPatients!
                                                    .patients[index].gender;
                                            globalVariables.patientId =
                                                globalVariables.getAllPatients!
                                                    .patients[index].patientId;
                                            globalVariables.patientImg =
                                                globalVariables
                                                    .getAllPatients!
                                                    .patients[index]
                                                    .profileImage;
                                            NavigationService()
                                                .navigateToScreen(
                                                    PatientPrescriptionPage(
                                                        globalVariables
                                                            .getAllPatients!
                                                            .patients[index]
                                                            .name,
                                                        globalVariables
                                                            .getAllPatients!
                                                            .patients[index]
                                                            .age,
                                                        globalVariables
                                                            .getAllPatients!
                                                            .patients[index]
                                                            .ageType,
                                                        globalVariables
                                                            .getAllPatients!
                                                            .patients[index]
                                                            .gender,
                                                        globalVariables
                                                            .getAllPatients!
                                                            .patients[index]
                                                            .profileImage));
                                          },
                                          child: Container(
                                            height: 120,
                                            width: 500,
                                            child: Column(
                                              children: [
                                                Card(
                                                  elevation: 0,
                                                  color: Color(0xffF3FBFF),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      CircleAvatar(
                                                        maxRadius: 45,
                                                        child: /*globalVariables
                                                          .getAllPatients!
                                                          .data
                                                          .patients[index]
                                                          .profileImage == "" ?  Image.asset(
                                                        // patientimage[index],
                                                        "assets/images/instadoclogo.png",
                                                        fit: BoxFit.fill,
                                                      ):*/
                                                            ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          child: Image.network(
                                                            // patientimage[index],
                                                            globalVariables
                                                                .getAllPatients!
                                                                .patients[index]
                                                                .profileImage,
                                                            fit: BoxFit.fill,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              // patientName[index],
                                                              globalVariables
                                                                  .getAllPatients!
                                                                  .patients[
                                                                      index]
                                                                  .name,
                                                              style: TextStyle(
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  // "${patientAge[index]} Years -",
                                                                  "${globalVariables.getAllPatients!.patients[index].age} ${globalVariables.getAllPatients!.patients[index].ageType} -",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      color: Color(
                                                                          0xffAEAEAE)),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                  // patientGender[index],
                                                                  globalVariables
                                                                      .getAllPatients!
                                                                      .patients[
                                                                          index]
                                                                      .gender,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      color: Color(
                                                                          0xffAEAEAE)),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                new Divider(
                                                  color: Color(0xffE6E6E6),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
              ),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          // isExtended: true,
          child: Icon(Icons.add),
          backgroundColor: Color(0xffCFCFCF),
          onPressed: () {
            NavigationService().navigateToScreen(AddPatientPage());
          },
        ),
      ),
    );
  }
}
