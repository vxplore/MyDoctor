import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/pages/addMedication_page.dart';
import 'package:my_doctor/service/navigation_service.dart';
import 'package:my_doctor/view_models/addMedication_view_model.dart';

import '../../core/utilites/getMedicineDosageDuration_response_data.dart';
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

  final vm = AddMedicationViewModel();
  List<Datum> _foundUsers = [];
  late TextEditingController _searchController;

  @override
  void initState() {
    // _foundUsers = _allUsers;
    _searchController = TextEditingController();
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Datum> results = [];
    if (enteredKeyword.isEmpty) {
      // results = _allUsers;
    } else {
      results = globalVariables.getMedicineDosageDuration!.data
          .where((user) =>
          user.duration.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }
  @override
  Widget build(BuildContext context) {
    Map? dataFromDialogduration =
        ModalRoute.of(context)?.settings.arguments as Map?;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 14, top: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color(0xffDFD0D0), // Border color
                    width: 0.5, // Border width
                  ),
                ),
                // height: 70,
                width: 390,
                child: FocusScope(
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    controller: _searchController,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.only(left: 20.0, top: 15, bottom: 10),
                      isDense: true,
                      border: InputBorder.none,
                      labelStyle:
                      TextStyle(fontSize: 18, color: Color(0xffBBBBBB)),
                      labelText: 'Search for Dose Regimen',
                      suffixIcon: _searchController.text == ""
                          ? Icon(Icons.search,
                          color: Color(0xffDFDFDF), size: 40)
                          : InkWell(
                        onTap: () {
                          _searchController.clear();
                          FocusScope.of(context).unfocus();
                        },
                        child: Icon(Icons.clear,
                            color: Color(0xffDFDFDF), size: 40),
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
                itemBuilder: (context, index) => ListTile(
                  onTap: () async {
                    dataFromDialogduration = await showDialog(
                        context: context,
                        builder: (context) => StartMedicationDialog(),
                        barrierDismissible: false);
                    setState(() {
                      // globalVariables.durations = "To Coninue";
                      globalVariables.durations = _foundUsers[index]
                          .duration;
                      globalVariables.durationsId =_foundUsers[index].id;
                    });
                    var entryList = dataFromDialogduration?.entries.toList();
                    print("button pressed: ${globalVariables.durations}");
                    print("button pressed: ${globalVariables.durationsId}");
                    print("${dataFromDialogduration}");
                    print(entryList?[0].value);
                    globalVariables.startMediactionFrom = entryList?[0].value;
                    globalVariables.selectedLanguage = entryList?[1].value;
                    globalVariables.medicineRemarks = entryList?[2].value;
                    _searchController.clear();
                    FocusScope.of(context).unfocus();
                  },
                  title: Text(_foundUsers[index].duration),
                ),
              )
                  : Align(
                alignment: Alignment.topCenter,
                child: const Text(
                  'No results found',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      color: Colors.red),
                ),
              ),
            )
                : Container(
              height: 0,
              width: 0,
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
                    // height: 270,
                     width: 500,
                    child: Card(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        // padding: EdgeInsets.only(left: 14, right: 7),
                        // height: 80,
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
