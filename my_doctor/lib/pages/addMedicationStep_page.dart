import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_doctor/custom%20widget/medicationConsumeDialog.dart';
import 'package:my_doctor/pages/patient_complaints_page.dart';
import 'package:my_doctor/service/global_variables.dart';

import '../custom widget/startMedicationDialog.dart';
import 'addMedication_page.dart';

class AddMedicationStepsPage extends StatefulWidget {
  const AddMedicationStepsPage({Key? key}) : super(key: key);

  @override
  _AddMedicationStepsPageState createState() => _AddMedicationStepsPageState();
}

class _AddMedicationStepsPageState extends State<AddMedicationStepsPage>
    with SingleTickerProviderStateMixin {
  // We need a TabController to control the selected tab programmatically
  late final _tabController = TabController(length: 5, vsync: this);
  bool isNameButtonClicked = false;
  bool isDoseButtonClicked = false;
  bool isDoseRegimenButtonClicked = false;
  bool isDurationsBUttonClicked = false;
  bool isDosageFormPageIndexChange = false;
  bool isNamePageIndexChange = false;
  bool isDosePageIndexChange = false;
  bool isDoseRegimentPageIndexChange = false;

  @override
  Widget build(BuildContext context) {
    var tabControllers = 0;
    setState(() {
      tabControllers = _tabController.index.toInt();
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
                  globalVariables.dosageform = null;
                  globalVariables.dose = null;
                  globalVariables.names = null;
                  globalVariables.doseregimen = null;
                  globalVariables.dataFromDialog = null;
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
        // Use TabBar to show the tabs
        /* bottom: ReadOnlyTabBar(
          child: TabBar(
            padding: EdgeInsets.only(left: 19),
            indicatorColor: Colors.transparent,
            isScrollable: true,
            labelPadding: EdgeInsets.only(left: 0),
            physics: AlwaysScrollableScrollPhysics(),
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                child: Container(
                  height: 50,
                  width: 190,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 160,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.green),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Dosage Form',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
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
              Tab(
                child: Container(
                  height: 50,
                  width: 130,
                  // color: Colors.cyan,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color(0xff0065D7),
                              border: Border.all(color: Color(0xff0065D7)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Name',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
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
              Tab(
                child: Container(
                  height: 50,
                  width: 130,
                  // color: Colors.cyan,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color(0xff0065D7),
                              border: Border.all(color: Color(0xff0065D7)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Dose',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
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
              Tab(
                text: 'Submit',
              ),
            ],
          ),
        ),*/
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
                  padding: EdgeInsets.only(left: 19,right: 19),
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  labelPadding: EdgeInsets.only(left: 0),
                  physics: AlwaysScrollableScrollPhysics(),
                  controller: _tabController,
                  tabs: <Widget>[
                    InkWell(
                      onTap: () => setState(() {
                        _tabController.index = 0;
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
                                                    null)
                                            /* ||
                                            (tabControllers == 1 ||
                                                tabControllers == 2 ||
                                                tabControllers == 3 ||
                                                tabControllers == 4 ||
                                                tabControllers == 5)  */
                                            &&
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
                                                      null)
                                              /* ||
                                          (tabControllers == 1 ||
                                              tabControllers == 2 ||
                                              tabControllers == 3 ||
                                              tabControllers == 4 ||
                                              tabControllers == 5)  */
                                              &&
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
                        _tabController.index = 1;
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
                          _tabController.index = 2;
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
                          _tabController.index = 3;
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
                          _tabController.index = 4;
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
              controller: _tabController,
              children: [
                DosageFormPage(
                    onNext: () => setState(() {
                          _tabController.index = 1;
                          isDosageFormPageIndexChange = true;
                        })),
                NamePage(
                  onNext: () => setState(() {
                    _tabController.index = 2;
                    isNamePageIndexChange = true;
                  }),
                ),
                DosePage(
                  onNext: () => setState(() {
                    _tabController.index = 3;
                    isDosePageIndexChange = true;
                  }),
                ),
                DoseRegimenPage(
                  onNext: () => setState(() {
                    _tabController.index = 4;
                    isDoseRegimentPageIndexChange = true;
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
                                globalVariables.dosageform = null;
                                globalVariables.dose = null;
                                globalVariables.names = null;
                                globalVariables.doseregimen = null;
                                globalVariables.dataFromDialog = null;
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



class DosageFormPage extends StatefulWidget {
  const DosageFormPage({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;

  @override
  State<DosageFormPage> createState() => _DosageFormPageState();
}

class _DosageFormPageState extends State<DosageFormPage> {
  // String? dosageform;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 19, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Dosages Form',
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
                        "Search Dosages Form",
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
            Container(
              height: 70,
              width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        // dosageform = "Tablet";
                        globalVariables.dosageform = "Tablet";
                        widget.onNext();
                      });
                      // print("button pressed: ${dosageform}");
                      print("button pressed: ${globalVariables.dosageform}");
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        elevation: 5,
                        child: Container(
                          // padding: EdgeInsets.only(left: 7, right: 7),
                          height: 80,
                          width: 150,
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
                              "Tablet",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        // dosageform = "Capsule";
                        globalVariables.dosageform = "Capsule";
                        widget.onNext();
                      });
                      // print("button pressed: ${dosageform}");
                      print("button pressed: ${globalVariables.dosageform}");
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(left: 7, right: 7),
                          height: 80,
                          width: 150,
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
                              "Capsule",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        // dosageform = "Syrup";
                        globalVariables.dosageform = "Syrup";
                        widget.onNext();
                      });
                      // print("button pressed: ${dosageform}");
                      print("button pressed: ${globalVariables.dosageform}");
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(left: 7, right: 7),
                          height: 80,
                          width: 150,
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
                              "Syrup",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
            /*  PrimaryButton(
              onPressed: _experience != null ? widget.onNext : null,
              text: 'Next',
            ),*/
          ],
        ),
      ),
    );
  }
}

class DosePage extends StatefulWidget {
  const DosePage({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;

  @override
  State<DosePage> createState() => _DosePageState();
}

class _DosePageState extends State<DosePage> {
  // String? _dose;

  /* final _experienceTitles = {
    Experience.tablet: 'Less than one year',
    Experience.capsule: 'One to three years',
    Experience.syrup: 'Three to five years',
  };*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 19, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Dose',
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
                        "Search Dose",
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
            Container(
              height: 70,
              width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        globalVariables.dose = "100mg";
                        widget.onNext();
                      });
                      print("button pressed: ${globalVariables.dose}");
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        elevation: 5,
                        child: Container(
                          // padding: EdgeInsets.only(left: 7, right: 7),
                          height: 80,
                          width: 150,
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
                              "100mg",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        globalVariables.dose = "400mg";
                        widget.onNext();
                      });
                      print("button pressed: ${globalVariables.dose}");
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(left: 7, right: 7),
                          height: 80,
                          width: 150,
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
                              "400mg",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        globalVariables.dose = "500mg";
                        widget.onNext();
                      });
                      print("button pressed: ${globalVariables.dose}");
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(left: 7, right: 7),
                          height: 80,
                          width: 150,
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
                              "500mg",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
            /*  PrimaryButton(
              onPressed: _experience != null ? widget.onNext : null,
              text: 'Next',
            ),*/
          ],
        ),
      ),
    );
  }
}

class NamePage extends StatefulWidget {
  const NamePage({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  // String? _names;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 19, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Dosages Form',
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
                        "Search Name",
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
            Container(
              height: 70,
              width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        globalVariables.names = "Paracetamol";
                        widget.onNext();
                      });
                      print("button pressed: ${globalVariables.names}");
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        elevation: 5,
                        child: Container(
                          // padding: EdgeInsets.only(left: 7, right: 7),
                          height: 80,
                          width: 150,
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
                              "Paracetamol",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
            /*  PrimaryButton(
              onPressed: _experience != null ? widget.onNext : null,
              text: 'Next',
            ),*/
          ],
        ),
      ),
    );
  }
}

class DoseRegimenPage extends StatefulWidget {
  const DoseRegimenPage({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;

  @override
  State<DoseRegimenPage> createState() => _DoseRegimenPageState();
}

class _DoseRegimenPageState extends State<DoseRegimenPage> {
  /* String? _doseregimen;
  String? _dataFromDialog;*/

  /* final _experienceTitles = {
    Experience.tablet: 'Less than one year',
    Experience.capsule: 'One to three years',
    Experience.syrup: 'Three to five years',
  };*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 19, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Dose Regimen',
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
                        "Search for Dose Regimen",
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
            Container(
              height: 70,
              width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () async {
                      globalVariables.dataFromDialog = await showDialog(
                          context: context,
                          builder: (context) => MedicationConsumeDialog(),
                          barrierDismissible: false);
                      setState(() {
                        globalVariables.doseregimen = "Twice Daily (1-0-1)";
                      });
                      print("button pressed: ${globalVariables.doseregimen}");
                      print(
                          "button pressed: ${globalVariables.dataFromDialog}");
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
                              "Twice Daily (1-0-1)",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      globalVariables.dataFromDialog = await showDialog(
                          context: context,
                          builder: (context) => MedicationConsumeDialog(),
                          barrierDismissible: false);
                      setState(() {
                        globalVariables.doseregimen =
                            "Three Time a Day (1-1-1)";
                      });

                      print("button pressed: ${globalVariables.doseregimen}");
                      print(
                          "button pressed: ${globalVariables.dataFromDialog}");
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(left: 7, right: 7),
                          height: 80,
                          // width: 150,
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
                              "Three Time a Day (1-1-1)",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            globalVariables.doseregimen == null
                ? Container(
                    height: 1,
                    width: 1,
                    color: Colors.white,
                  )
                : Container(
                    height: 150,
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
                              "Dose Regiment",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${globalVariables.doseregimen}",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 22, color: Colors.green),
                            ),
                            Text(
                              "How to Consume",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${globalVariables.dataFromDialog}",
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
                  onPressed: globalVariables.doseregimen != null
                      ? widget.onNext
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

  @override
  Widget build(BuildContext context) {
    // Map _dataFromDialogduration = ModalRoute.of(context)?.settings.arguments as Map;
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
            Container(
              height: 70,
              width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () async {
                      dataFromDialogduration = await showDialog(
                          context: context,
                          builder: (context) => StartMedicationDialog(),
                          barrierDismissible: false);
                      setState(() {
                        globalVariables.durations = "To Coninue";
                      });
                      var entryList = dataFromDialogduration?.entries.toList();
                      print("button pressed: ${globalVariables.durations}");
                      print("${dataFromDialogduration}");
                      print(entryList?[0].value);
                      globalVariables.startMediactionFrom = entryList?[0].value;
                      globalVariables.selectedLanguage = entryList?[1].value;
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
                              "To Coninue",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      dataFromDialogduration = await showDialog(
                          context: context,
                          builder: (context) => StartMedicationDialog(),
                          barrierDismissible: false);
                      setState(() {
                        globalVariables.durations = "SOS";
                      });

                      var entryList = dataFromDialogduration?.entries.toList();
                      print("button pressed: ${globalVariables.durations}");
                      print("${dataFromDialogduration}");
                      print(entryList?[0].value);
                      globalVariables.startMediactionFrom = entryList?[0].value;
                      globalVariables.selectedLanguage = entryList?[1].value;
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(left: 7, right: 7),
                          height: 80,
                          // width: 150,
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
                              "SOS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      dataFromDialogduration = await showDialog(
                          context: context,
                          builder: (context) => StartMedicationDialog(),
                          barrierDismissible: false);
                      setState(() {
                        globalVariables.durations = "1 Years";
                      });

                      var entryList = dataFromDialogduration?.entries.toList();
                      print("button pressed: ${globalVariables.durations}");
                      print("${dataFromDialogduration}");
                      print(entryList?[0].value);
                      globalVariables.startMediactionFrom = entryList?[0].value;
                      globalVariables.selectedLanguage = entryList?[1].value;
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(left: 7, right: 7),
                          height: 80,
                          // width: 150,
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
                              "1 Years",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                    height: 200,
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
                      ? widget.onSubmit
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
