import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/pages/addMedication_page.dart';
import 'package:my_doctor/pages/additionalAssesment_page.dart';
import 'package:my_doctor/pages/dashboardPage.dart';
import 'package:my_doctor/pages/main_dashboard_page.dart';
import 'package:my_doctor/pages/myPatient_page.dart';
import 'package:my_doctor/pages/patient_prescription_page.dart';
import 'package:my_doctor/pages/recommandedLabTest_page.dart';
import 'package:my_doctor/service/navigation_service.dart';

import '../service/global_variables.dart';
import 'chief_complaintsDetails_page.dart';

class SuggestLaboratoryPage extends StatefulWidget {
  const SuggestLaboratoryPage({super.key});

  @override
  State<SuggestLaboratoryPage> createState() => _SuggestLaboratoryPageState();
}

class _SuggestLaboratoryPageState extends State<SuggestLaboratoryPage> {
  final List<Map<String, dynamic>> items = [
    {'name': 'Apple', 'ID': '001', "phone": "235355554"},
    {'name': 'Strawberry', 'ID': '002', "phone": "23535559"},
    {'name': 'Orange', 'ID': '003', "phone": "235355552"},
    {'name': 'Kiwi', 'ID': '004', "phone": "235355551"},
    {'name': 'Grapes', 'ID': '005', "phone": "235355550"},
  ];

  Map<String, dynamic> selectedLaboratory = {};

  List<Map<String, dynamic>> finalselectedItems = [];

  List<Map<String, dynamic>> _foundUsers = [];
  late TextEditingController _searchController;

  @override
  void initState() {
    // _foundUsers = _allUsers;
    _searchController = TextEditingController();
    super.initState();
  }

  final TextEditingController _controller = TextEditingController();

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // results = _allUsers;
    } else {
      results = items
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
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
        NavigationService().navigateToScreen(RecommendedLabTestPage(
          labname: "",
        ));
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF3FBFF),
        appBar: AppBar(
          backgroundColor: Color(0xff1468B3),
          toolbarHeight: 70,
          leading: InkWell(
            onTap: () {
              NavigationService().navigateToScreen(RecommendedLabTestPage(
                labname: "",
              ));
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 35,
            ),
          ),
          title: Text(
            "Suggest Laboratory",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: 500,
            height: 760,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          labelText: 'Search for Laboratory',
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
                                  onTap: () {
                                    /* setState(() {
                                      finalselectedItems.add(
                                        {
                                          "name": _foundUsers[index]["name"],
                                          "ID": _foundUsers[index]["ID"],
                                          "phone": _foundUsers[index]["phone"]
                                        },
                                      );
                                    });*/
                                    bool isDuplicate = finalselectedItems.any(
                                        (item) =>
                                            item["name"] ==
                                            _foundUsers[index]["name"]);

                                    if (!isDuplicate) {
                                      setState(() {
                                        finalselectedItems.add(
                                          {
                                            "name": _foundUsers[index]["name"],
                                            "ID": _foundUsers[index]["ID"],
                                            "phone": _foundUsers[index]["phone"]
                                          },
                                        );
                                      });
                                    }
                                    _searchController.clear();
                                    FocusScope.of(context).unfocus();
                                  },
                                  title: Text(_foundUsers[index]['name']),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  _showAddItemDialog();
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'No results found. Click here to add as new laboratory',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        decoration: TextDecoration.underline,
                                        color: Colors.red),
                                  ),
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
                    "Laboratory",
                    style: TextStyle(fontSize: 24, color: Color(0xffC4C4C4)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  height: _searchController.text != "" ? 285 : 480,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.grey,
                      );
                    },
                    itemCount: finalselectedItems.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 65,
                        width: 420,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Name - ${finalselectedItems[index]["name"]}\nPhone - ${finalselectedItems[index]["phone"]}",
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xffBBBBBB)),
                              ),
                              Spacer(),
                              InkWell(
                                  onTap: () {
                                    selectedLaboratory.addAll({
                                      "name": finalselectedItems[index]["name"],
                                      "ID": finalselectedItems[index]["ID"],
                                      "phone": finalselectedItems[index]
                                          ["phone"]
                                    });
                                    var snackdemo = SnackBar(
                                      content: Text("Added Successfully"),
                                      backgroundColor: Colors.green,
                                      elevation: 10,
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.all(5),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackdemo);
                                  },
                                  child: Text("Select")),
                              Spacer(),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      finalselectedItems.removeAt(index);
                                    });
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: Colors.red,
                                  ))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.all(17),
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      print("selected laboratory :$selectedLaboratory");
                      globalVariables.labNamess = selectedLaboratory["name"];
                      NavigationService()
                          .navigateToScreen(RecommendedLabTestPage(
                        labname: globalVariables.labNamess!,
                      ));
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
      ),
    );
  }

  Future<String?> _showAddItemDialog() async {
    _controller.text = _searchController.text;
    return showDialog<String>(
      context: context,
      builder: (context) {
        String? itemName =
            _searchController.text; // Initialize itemName variable here.
        String? itemName2;
        return AlertDialog(
          title: Text("Add New Laboratory"),
          content: Container(
            height: 150,
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(labelText: "Laboratory Name"),
                  onChanged: (value) {
                    itemName = value; // Assign the entered value to itemName.
                  },
                ),
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: "Laboratory Phone"),
                  onChanged: (value) {
                    itemName2 = value; // Assign the entered value to itemName.
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog.
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (_controller.text != "" &&
                    itemName != null &&
                    itemName!.isNotEmpty &&
                    itemName2 != null &&
                    itemName2!.isNotEmpty) {
                  /*setState(() {
                    final newEntryss = {
                      "name": itemName,
                      "ID": "",
                      "phone": itemName2
                    };

                    finalselectedItems.add(newEntryss);
                  });*/
                  bool isDuplicate = finalselectedItems
                      .any((item) => item["name"] == itemName);

                  if (!isDuplicate) {
                    setState(() {
                      finalselectedItems.add(
                        {"name": itemName, "ID": "", "phone": itemName2},
                      );
                      items.add(
                        {"name": itemName, "ID": "", "phone": itemName2},
                      );
                      print(finalselectedItems);
                      _controller.clear();
                      FocusScope.of(context).unfocus();
                      _searchController.clear();
                      FocusScope.of(context).unfocus();
                    });
                  }

                  // showSearchResults = false;
                  Navigator.of(context).pop(); // Close the dialog.
                }
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }
}
