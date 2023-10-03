import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_doctor/custom%20widget/medicationConsumeDialog.dart';
import 'package:my_doctor/pages/patient_complaints_page.dart';
import 'package:my_doctor/service/global_variables.dart';

import '../custom widget/startMedicationDialog.dart';
import 'addMedication_page.dart';
import 'inner page/dosageForm_page.dart';
import 'inner page/doseRegimen_page.dart';
import 'inner page/dose_page.dart';
import 'inner page/durations_page.dart';
import 'inner page/medicineName_page.dart';

class AddMedicationStepsPage extends StatefulWidget {
  const AddMedicationStepsPage({Key? key}) : super(key: key);

  @override
  _AddMedicationStepsPageState createState() => _AddMedicationStepsPageState();
}

class _AddMedicationStepsPageState extends State<AddMedicationStepsPage>
    with SingleTickerProviderStateMixin {
  // We need a TabController to control the selected tab programmatically
  late final tabController = TabController(length: 5, vsync: this);
  bool isNameButtonClicked = false;
  bool isDoseButtonClicked = false;
  bool isDoseRegimenButtonClicked = false;
  bool isDurationsBUttonClicked = false;
  bool isDosageFormPageIndexChange = false;
  bool isNamePageIndexChange = false;
  bool isDosePageIndexChange = false;

  // bool isDoseRegimentPageIndexChange = false;

  @override
  Widget build(BuildContext context) {
    var tabControllers = 0;
    setState(() {
      tabControllers = tabController.index.toInt();
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xff1468B3),
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: InkWell(
              onTap: () {
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
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: 19),
          child: Text(
            'Add Medication',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            color: Colors.white, // Tab Bar color change
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                width: 420,
                child: TabBar(
                  padding: EdgeInsets.only(left: 19, right: 19),
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  labelPadding: EdgeInsets.only(left: 0),
                  physics: AlwaysScrollableScrollPhysics(),
                  controller: tabController,
                  tabs: <Widget>[
                    InkWell(
                      onTap: () => setState(() {
                        tabController.index = 0;
                      }),
                      child: Tab(
                        // text: "Dosage Form",
                        child: Container(
                          height: 50,

                          // color: Colors.red,
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: (tabControllers == 1 ||
                                                tabControllers == 2 ||
                                                tabControllers == 3 ||
                                                tabControllers == 4 ||
                                                tabControllers == 5 ||
                                                globalVariables.dosageform !=
                                                    null) &&
                                            (globalVariables.dosageform != null)
                                        ? Colors.green
                                        : Color(0xff0065D7),
                                    border: Border.all(
                                      color: (tabControllers == 1 ||
                                                  tabControllers == 2 ||
                                                  tabControllers == 3 ||
                                                  tabControllers == 4 ||
                                                  tabControllers == 5 ||
                                                  globalVariables.dosageform !=
                                                      null) &&
                                              (globalVariables.dosageform !=
                                                  null)
                                          ? Colors.green
                                          : Color(0xff0065D7),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    globalVariables.dosageform == null
                                        ? 'Dosages Form'
                                        : "${globalVariables.dosageform}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => setState(() {
                        tabController.index = 1;
                        isNameButtonClicked = true;
                      }),
                      child: Tab(
                        child: Container(
                          height: 50,

                          // color: Colors.cyan,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: (tabControllers == 2 ||
                                                  tabControllers == 3 ||
                                                  tabControllers == 4 ||
                                                  tabControllers == 5 ||
                                                  globalVariables.names !=
                                                      null) &&
                                              (globalVariables.names != null)
                                          ? Colors.green
                                          : Color(0xff0065D7),
                                      border: Border.all(
                                        color: (tabControllers == 2 ||
                                                    tabControllers == 3 ||
                                                    tabControllers == 4 ||
                                                    tabControllers == 5 ||
                                                    globalVariables.names !=
                                                        null) &&
                                                (globalVariables.names != null)
                                            ? Colors.green
                                            : Color(0xff0065D7),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      globalVariables.names == null
                                          ? 'Name'
                                          : "${globalVariables.names}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => setState(() {
                        if (isNamePageIndexChange == true ||
                            globalVariables.names != null) {
                          tabController.index = 2;
                        } else {}
                        isDoseButtonClicked = true;
                      }),
                      child: Tab(
                        child: Container(
                          height: 50,

                          // color: Colors.cyan,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: (tabControllers == 3 ||
                                                  tabControllers == 4 ||
                                                  tabControllers == 5 ||
                                                  globalVariables.dose !=
                                                      null) &&
                                              (globalVariables.dose != null)
                                          ? Colors.green
                                          : Color(0xff0065D7),
                                      border: Border.all(
                                        color: (tabControllers == 3 ||
                                                    tabControllers == 4 ||
                                                    tabControllers == 5 ||
                                                    globalVariables.dose !=
                                                        null) &&
                                                (globalVariables.dose != null)
                                            ? Colors.green
                                            : Color(0xff0065D7),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      globalVariables.dose == null
                                          ? 'Dose'
                                          : "${globalVariables.dose}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => setState(() {
                        if (isNamePageIndexChange == true ||
                            globalVariables.names != null) {
                          tabController.index = 3;
                        } else {}
                        isDoseRegimenButtonClicked = true;
                      }),
                      child: Tab(
                        child: Container(
                          height: 50,

                          // color: Colors.cyan,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: (tabControllers == 4 ||
                                                  tabControllers == 5 ||
                                                  globalVariables.doseregimen !=
                                                      null) &&
                                              (globalVariables.doseregimen !=
                                                  null)
                                          ? Colors.green
                                          : Color(0xff0065D7),
                                      border: Border.all(
                                        color: (tabControllers == 4 ||
                                                    tabControllers == 5 ||
                                                    globalVariables
                                                            .doseregimen !=
                                                        null) &&
                                                (globalVariables.doseregimen !=
                                                    null)
                                            ? Colors.green
                                            : Color(0xff0065D7),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      globalVariables.doseregimen == null
                                          ? 'Dose Regimen'
                                          : "${globalVariables.doseregimen}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => setState(() {
                        if (isNamePageIndexChange == true ||
                            globalVariables.names != null) {
                          tabController.index = 4;
                        } else {}
                        isDurationsBUttonClicked = true;
                      }),
                      child: Tab(
                        child: Container(
                          height: 50,

                          // color: Colors.cyan,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: (tabControllers == 5 ||
                                                  globalVariables.durations !=
                                                      null) &&
                                              (globalVariables.durations !=
                                                  null)
                                          ? Colors.green
                                          : Color(0xff0065D7),
                                      border: Border.all(
                                        color: (tabControllers == 5 ||
                                                    globalVariables.durations !=
                                                        null) &&
                                                (globalVariables.durations !=
                                                    null)
                                            ? Colors.green
                                            : Color(0xff0065D7),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      globalVariables.durations == null
                                          ? 'Durations'
                                          : "${globalVariables.durations}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
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
          ),
          Expanded(
            flex: 3,
            child: TabBarView(
              // make sure we can't switch tabs with interactive drag gestures
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                DosageFormPage(
                    onNext: () => setState(() {
                          tabController.index = 1;
                          isDosageFormPageIndexChange = true;
                        })),
                NamePage(
                  onNext: () => setState(() {
                    tabController.index = 2;
                    isNamePageIndexChange = true;
                  }),
                ),
                DosePage(
                  onNext: () => setState(() {
                    tabController.index = 3;
                    isDosePageIndexChange = true;
                  }),
                ),
                DoseRegimenPage(
                  onNext: () => setState(() {
                    tabController.index = 4;
                    globalVariables.isDoseRegimentPageIndexChange = true;
                  }),
                ),
                DurationPage(
                  onSubmit: () => showCupertinoDialog(
                    context: context,
                    builder: (_) {
                      return CupertinoAlertDialog(
                        title: const Text('Success'),
                        content: const Text('Medicine Added Successfully'),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text('OK'),
                            onPressed: () {
                              // dismiss dialog
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
                                globalVariables.dataFromDialogdoseregimen =
                                    null;
                                globalVariables.durations = null;
                                globalVariables.startMediactionFrom = null;
                                globalVariables.selectedLanguage = null;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddMedicationPage()),
                              );
                              // _tabController.index = 0;
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.text, this.onPressed})
      : super(key: key);
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
