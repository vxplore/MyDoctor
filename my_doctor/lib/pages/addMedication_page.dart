import 'dart:async';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/custom%20widget/custom_circularProgress.dart';
import 'package:my_doctor/pages/additionalAssesment_page.dart';
import 'package:my_doctor/service/global_variables.dart';
import 'package:my_doctor/service/navigation_service.dart';
import 'package:my_doctor/view_models/addMedication_view_model.dart';

import 'addMedicationStep_page.dart';

class AddMedicationPage extends StatefulWidget {
  const AddMedicationPage({super.key});

  @override
  State<AddMedicationPage> createState() => _AddMedicationPageState();
}

class _AddMedicationPageState extends State<AddMedicationPage> {
  final vm = AddMedicationViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) async {
      if (timer.tick == 1) {
        vm.getMedicinesApi();
        vm.getMedicineDosageFormApi();
        vm.getMedicineNameApi();
        vm.getMedicineDosageQuantityApi();
        vm.getMedicineDosageRegimenApi();
        vm.getMedicineDosageDurationApi();
        await Future.delayed(Duration(seconds: 1));
        setState(() {
          globalVariables.getMedicineList =
              globalVariables.getMedicineListFromApi;
          globalVariables.getDosageForm = globalVariables.getDosageFormFromApi;
          globalVariables.getMedicineName =
              globalVariables.getMedicineNameFromApi;
          globalVariables.getMedicineDosageQuantity =
              globalVariables.getMedicineDosageQuantityFromApi;
          globalVariables.getMedicineDosageRegimen =
              globalVariables.getMedicineDosageRegimenFromApi;
          globalVariables.getMedicineDosageDuration =
              globalVariables.getMedicineDosageDurationFromApi;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        NavigationService().navigateToScreen(AdditionalAssesmentPage());
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF6F6F6),
        appBar: AppBar(
          backgroundColor: Color(0xff1468B3),
          toolbarHeight: 89,
          leading: Padding(
            padding: const EdgeInsets.only(left: 18),
            child: InkWell(
              onTap: () {
                NavigationService().navigateToScreen(AdditionalAssesmentPage());
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
          leadingWidth: 40,
          title: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add Medication",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                Row(
                  children: [
                    Text(
                      "${globalVariables.patientName} | ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffDBDBDB)),
                    ),
                    Text(
                      "${globalVariables.patientAge} ${globalVariables.patientAgeType} | ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffDBDBDB)),
                    ),
                    Text(
                      "${globalVariables.patientsGender}",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffDBDBDB)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        /////// body te 1 Container nite hobe then child e column nie tar children e 2 container nite hobe 1 ta tablet gulor jonne ar onnota suggest ppharmecy theke done button er jonno ///////////

        body: globalVariables.getMedicineList == null
            ? MyCircularIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    // height: 90,
                    // color: Colors.red,
                    height: 540,
                    margin: EdgeInsets.only(left: 19, right: 18),
                    child: CustomRefreshIndicator(
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
                            vm.getMedicinesApi();
                            await Future.delayed(Duration(seconds: 1));
                            setState(() {
                              globalVariables.getMedicineList =
                                  globalVariables.getMedicineListFromApi;
                            });
                            var snackdemo = SnackBar(
                              content: Text("Refreshed"),
                              backgroundColor: Colors.green,
                              elevation: 10,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(5),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackdemo);
                          },
                        );
                      },
                      child: globalVariables
                                  .getMedicineList!.medicine.isEmpty ==
                              true
                          ? Center(
                              child: Text(
                                  textAlign: TextAlign.center,
                                  "No medicine prescribe yet!!!\n\nClick on + button to add medicine"),
                            )
                          : ListView.builder(
                              itemCount: globalVariables
                                  .getMedicineList!.medicine.length,
                              scrollDirection: Axis.vertical,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.zero),
                                  elevation: 5,
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(left: 14, right: 7),
                                    height: 80,
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 17, bottom: 13),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                // "Tablet",
                                                "${globalVariables.getMedicineList!.medicine[index].type}",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Color(0xff0266D5)),
                                              ),
                                              Spacer(),
                                              Row(
                                                children: [
                                                  Text(
                                                    // "Paracetamol",
                                                    "${globalVariables.getMedicineList!.medicine[index].name}",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    // "(300mg)",
                                                    " (${globalVariables.getMedicineList!.medicine[index].dose})",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            Color(0xffA2A2A2)),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 16, top: 26, bottom: 26),
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.black,
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                  /*SizedBox(
              height: 440,
            ),*/
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 80,
                      width: 500,
                      margin: EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchForLaboratoryPage()),
                        );*/
                            },
                            child: Text(
                              textAlign: TextAlign.center,
                              "+ Suggest Pharmacy",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () async {
                              await Future.delayed(
                                  Duration(milliseconds: 1300));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AddMedicationStepsPage()),
                              );
                            },
                            child: Container(
                              height: 70,
                              width: 70,
                              margin: EdgeInsets.only(right: 33),
                              decoration: new BoxDecoration(
                                color: Color(0xffCFCFCF),
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xffFFFFFF),
                                  size: 40,
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
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.only(left: 19, right: 18),
                      height: 70,
                      width: 500,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            padding: const EdgeInsets.all(12),
                            backgroundColor: Color(0xff1468B3)),
                        onPressed: () {},
                        child: Text(
                          "Done",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
