import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_doctor/custom%20widget/medicationConsumeDialog.dart';
import 'package:my_doctor/pages/patient_complaints_page.dart';

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

  @override
  Widget build(BuildContext context) {
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
            child: ReadOnlyTabBar(
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
                  Tab(
                    child: Container(
                      height: 50,
                      width: 170,
                      // color: Colors.cyan,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 140,
                              decoration: BoxDecoration(
                                  color: Color(0xff0065D7),
                                  border: Border.all(color: Color(0xff0065D7)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Dose Regimen',
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
                  Tab(
                    child: Container(
                      height: 50,
                      width: 170,
                      // color: Colors.cyan,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 140,
                              decoration: BoxDecoration(
                                  color: Color(0xff0065D7),
                                  border: Border.all(color: Color(0xff0065D7)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Durations',
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
                ],
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
                  onNext: () => _tabController.index = 1,
                ),
                NamePage(
                  onNext: () => _tabController.index = 2,
                ),
                DosePage(
                  onNext: () => _tabController.index = 3,
                ),
                DoseRegimenPage(
                  onNext: () => _tabController.index = 4,
                ),
                DurationPage(
                  onSubmit: () => showCupertinoDialog(
                    context: context,
                    builder: (_) {
                      return CupertinoAlertDialog(
                        title: const Text('Thank you'),
                        content: const Text('Your application was submitted.'),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text('OK'),
                            onPressed: () {
                              // dismiss dialog
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

// https://stackoverflow.com/a/57354375/436422
class ReadOnlyTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabBar child;

  const ReadOnlyTabBar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(child: child);
  }

  @override
  Size get preferredSize => child.preferredSize;
}

enum Experience {
  tablet,
  capsule,
  syrup,
}

class DosageFormPage extends StatefulWidget {
  const DosageFormPage({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;

  @override
  State<DosageFormPage> createState() => _DosageFormPageState();
}

class _DosageFormPageState extends State<DosageFormPage> {
  String? _dosageform;

  /*final _experienceTitles = {
    Experience.tablet: 'Tablet',
    Experience.capsule: 'Capsule',
    Experience.syrup: 'Syrup',
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
                        _dosageform = "Tablet";
                        widget.onNext();
                      });
                      print("button pressed: ${_dosageform}");
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
                        _dosageform = "Capsule";
                        widget.onNext();
                      });
                      print("button pressed: ${_dosageform}");
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
                        _dosageform = "Syrup";
                        widget.onNext();
                      });
                      print("button pressed: ${_dosageform}");
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
  String? _dose;

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
                        _dose = "100mg";
                        widget.onNext();
                      });
                      print("button pressed: ${_dose}");
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
                        _dose = "400mg";
                        widget.onNext();
                      });
                      print("button pressed: ${_dose}");
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
                        _dose = "500mg";
                        widget.onNext();
                      });
                      print("button pressed: ${_dose}");
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
  String? _names;

  /* final _experienceTitles = {
    Skill.flutter: 'Flutter',
    Skill.dart: 'Dart',
    Skill.firebase: 'Firebase',
    Skill.cloudFunctions: 'Cloud Functions',
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
                        _names = "Paracetamol";
                        widget.onNext();
                      });
                      print("button pressed: ${_names}");
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
  String? _doseregimen;
  String? _dataFromDialog;

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
                      _dataFromDialog = await showDialog(
                          context: context,
                          builder: (context) => MedicationConsumeDialog(),
                          barrierDismissible: false);
                      setState(() {
                        _doseregimen = "Twice Daily (1-0-1)";
                      });
                      print("button pressed: ${_doseregimen}");
                      print("button pressed: ${_dataFromDialog}");
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
                      _dataFromDialog = await showDialog(
                          context: context,
                          builder: (context) => MedicationConsumeDialog(),
                          barrierDismissible: false);
                      setState(() {
                        _doseregimen = "Three Time a Day (1-1-1)";
                      });

                      print("button pressed: ${_doseregimen}");
                      print("button pressed: ${_dataFromDialog}");
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
            _doseregimen == null
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
                              "${_doseregimen}",
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
                              "${_dataFromDialog}",
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
                  onPressed: _doseregimen != null ? widget.onNext : null,
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
  String? _durations;
  // String? _dataFromDialogduration;


  @override
  Widget build(BuildContext context) {
    // Map _dataFromDialogduration = ModalRoute.of(context)?.settings.arguments as Map;
    var _dataFromDialogduration = ModalRoute.of(context)?.settings.arguments as Map<String,String>;
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
                      _dataFromDialogduration = await showDialog(
                          context: context,
                          builder: (context) => StartMedicationDialog(),
                          barrierDismissible: false);
                      setState(() {
                        _durations = "To Coninue";
                      });
                      print("button pressed: ${_durations}");
                      print("button pressed: ${_dataFromDialogduration}");
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
                      _dataFromDialogduration = await showDialog(
                          context: context,
                          builder: (context) => StartMedicationDialog(),
                          barrierDismissible: false);
                      setState(() {
                        _durations = "SOS";
                      });

                      print("button pressed: ${_durations}");
                      print("button pressed: ${_dataFromDialogduration}");
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
                      _dataFromDialogduration = await showDialog(
                          context: context,
                          builder: (context) => StartMedicationDialog(),
                          barrierDismissible: false);
                      setState(() {
                        _durations = "1 Years";
                      });

                      print("button pressed: ${_durations}");
                      print("button pressed: ${_dataFromDialogduration}");
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
            _durations == null
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
                              "${_durations}",
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
                              "${_dataFromDialogduration}",
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
                  onPressed: _durations != null ? widget.onSubmit : null,
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
