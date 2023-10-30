import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/pages/addMedication_page.dart';
import 'package:my_doctor/service/navigation_service.dart';
import 'package:my_doctor/view_models/addMedication_view_model.dart';

import '../../custom widget/startMedicationDialog.dart';
import '../../service/global_variables.dart';
import '../patient_complaints_page.dart';

class DurationPage extends StatefulWidget {
  const DurationPage({Key? key, required this.onSubmit}) : super(key: key);
  final VoidCallback onSubmit;

  @override
  State<DurationPage> createState() => _DurationPageState();
}

class _DurationPageState extends State<DurationPage> {
  // String? _durations;

  // String? _dataFromDialogduration;
  /* String? startMediactionFrom;
  String? selectedLanguage;*/
  final vm = AddMedicationViewModel();

  @override
  Widget build(BuildContext context) {
    Map? dataFromDialogduration =
        ModalRoute.of(context)?.settings.arguments as Map?;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 19, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Durations',
              style: TextStyle(color: Color(0xff0266D5), fontSize: 25),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegate());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color(0xffDFD0D0), // Border color
                    width: 0.5, // Border width
                  ),
                ),
                height: 70,
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 19),
                      child: Text(
                        "Search for Duration",
                        style:
                            TextStyle(fontSize: 21, color: Color(0xffA5A5A5)),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        // method to show the search bar
                        showSearch(
                            context: context,
                            // delegate to customize the search bar
                            delegate: CustomSearchDelegate());
                      },
                      icon: const Icon(Icons.search,
                          color: Color(0xffDFDFDF), size: 40),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            GridView.builder(
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 55),
              itemCount:
                  globalVariables.getMedicineDosageDuration!.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 70,
                  width: 500,
                  child: InkWell(
                    onTap: () async {
                      dataFromDialogduration = await showDialog(
                          context: context,
                          builder: (context) => StartMedicationDialog(),
                          barrierDismissible: false);
                      setState(() {
                        // globalVariables.durations = "To Coninue";
                        globalVariables.durations = globalVariables
                            .getMedicineDosageDuration!

                            .data[index]
                            .duration;
                        globalVariables.durationsId = globalVariables
                            .getMedicineDosageDuration!.data[index].id;
                      });
                      var entryList = dataFromDialogduration?.entries.toList();
                      print("button pressed: ${globalVariables.durations}");
                      print("button pressed: ${globalVariables.durationsId}");
                      print("${dataFromDialogduration}");
                      print(entryList?[0].value);
                      globalVariables.startMediactionFrom = entryList?[0].value;
                      globalVariables.selectedLanguage = entryList?[1].value;
                      globalVariables.medicineRemarks = entryList?[2].value;
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        elevation: 5,
                        child: Container(
                          // padding: EdgeInsets.only(left: 7, right: 7),
                          height: 80,

                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              // "To Coninue",
                              globalVariables.getMedicineDosageDuration!.data[index].duration,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            globalVariables.durations == null
                ? Container(
                    height: 1,
                    width: 1,
                    color: Colors.white,
                  )
                : Container(
                    height: 270,
                    width: 500,
                    child: Card(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.only(left: 14, right: 7),
                        height: 80,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Durations",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${globalVariables.durations}",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 22, color: Colors.green),
                            ),
                            Text(
                              "Start Medicine From",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${globalVariables.startMediactionFrom}",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 22, color: Colors.green),
                            ),
                            Text(
                              "Remarks",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${globalVariables.medicineRemarks}",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 22, color: Colors.green),
                            ),
                            Text(
                              "Language",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${globalVariables.selectedLanguage}",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 22, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            /*for (var item in Experience.values)
              RadioListTile<Experience>(
                title: Text(_experienceTitles[item]!),
                value: item,
                groupValue: _experience,
                onChanged: (value) {
                  setState(() => _experience = value);
                },
              ),*/
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 55,
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
                  onPressed: globalVariables.durations != null
                      // ? widget.onSubmit
                      ? () async {
                          // widget.onSubmit;
                          vm.addMedicineApi(context);
                          setState(() {
                            globalVariables.dosageFormId = null;
                            globalVariables.nameId = null;
                            globalVariables.doseId = null;
                            globalVariables.doseregimenId = null;
                            globalVariables.durationsId = null;
                            globalVariables.dosageform = null;
                            globalVariables.dose = null;
                            globalVariables.names = null;
                            globalVariables.doseregimen = null;
                            globalVariables.dataFromDialogdoseregimen = null;
                            globalVariables.durations = null;
                            globalVariables.startMediactionFrom = null;
                            globalVariables.selectedLanguage = null;
                          });

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddMedicationPage(pharmacyname: globalVariables.pharmacynamess!,)));
                        }
                      : null,
                  child: Text(
                    "Done",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
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
