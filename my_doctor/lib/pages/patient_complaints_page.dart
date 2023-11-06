import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/pages/additionalAssesment_page.dart';
import 'package:my_doctor/pages/dashboardPage.dart';
import 'package:my_doctor/pages/main_dashboard_page.dart';
import 'package:my_doctor/pages/myPatient_page.dart';
import 'package:my_doctor/pages/patient_prescription_page.dart';
import 'package:my_doctor/service/navigation_service.dart';

import '../service/global_variables.dart';
import 'chief_complaintsDetails_page.dart';

class PatientComplaintsPage extends StatefulWidget {
  const PatientComplaintsPage({super.key});

  @override
  State<PatientComplaintsPage> createState() => _PatientComplaintsPageState();
}

class _PatientComplaintsPageState extends State<PatientComplaintsPage> {
  final List<Map<String, dynamic>> items = [
    {'name': 'Apple', 'ID': '001'},
    {'name': 'Strawberry', 'ID': '002'},
    {'name': 'Orange', 'ID': '003'},
    {'name': 'Kiwi', 'ID': '004'},
    {'name': 'Grapes', 'ID': '005'},
  ];

  List<Map<String, dynamic>> finalselectedItems = [];

  List<Map<String, dynamic>> _foundUsers = [];
  late TextEditingController _searchController;

  @override
  void initState() {
    // _foundUsers = _allUsers;
    _searchController = TextEditingController();
    super.initState();
  }

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
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PatientPrescriptionPage(
                  globalVariables.patientName!,
                  globalVariables.patientAge!,
                  globalVariables.patientAgeType!,
                  globalVariables.patientsGender!,
                  globalVariables.patientImg!)),
        );
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
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PatientPrescriptionPage(
                        globalVariables.patientName!,
                        globalVariables.patientAge!,
                        globalVariables.patientAgeType!,
                        globalVariables.patientsGender!,
                        globalVariables.patientImg!)),
              );
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 35,
            ),
          ),
          title: Text(
            "${globalVariables.patientName}'s Complaints",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
              top: 10, bottom: MediaQuery.of(context).viewInsets.bottom),
          // scrollDirection: Axis.vertical,
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
                        scrollPadding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 20.0, top: 15, bottom: 10),
                          isDense: true,
                          border: InputBorder.none,
                          labelStyle:
                              TextStyle(fontSize: 18, color: Color(0xffBBBBBB)),
                          labelText: 'Search for Complains',
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
                                    setState(() {
                                      finalselectedItems.add(
                                        {
                                          "name": _foundUsers[index]["name"],
                                          "ID": _foundUsers[index]["ID"],
                                        },
                                      );
                                    });
                                    _searchController.clear();
                                    FocusScope.of(context).unfocus();
                                  },
                                  title: Text(_foundUsers[index]['name']),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  setState(() {
                                    finalselectedItems.add(
                                      {
                                        "name": _searchController.text,
                                        "ID": ""
                                      },
                                    );
                                    _searchController.clear();
                                    FocusScope.of(context).unfocus();
                                  });
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'No results found. Click here to add as new complain',
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
                    "Complaints",
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
                                finalselectedItems[index]["name"],
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xffBBBBBB)),
                              ),
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
                // Spacer(),
                Container(
                  margin: EdgeInsets.all(17),
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      print("chief complaints :$finalselectedItems");
                      NavigationService()
                          .navigateToScreen(AdditionalAssesmentPage());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff1468B3),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                    child: Text(finalselectedItems.isEmpty ? "Skip" : "Done"),
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

/*  Future<String?> _showAddItemDialog() async {
    return showDialog<String>(
      context: context,
      builder: (context) {
        String? itemName; // Initialize itemName variable here.

        return AlertDialog(
          title: Text("Add New Item"),
          content: TextField(
            decoration: InputDecoration(labelText: "Item Name"),
            onChanged: (value) {
              itemName = value; // Assign the entered value to itemName.
            },
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
                if (itemName != null && itemName!.isNotEmpty) {
                  setState(() {
                    final newEntryss = {"name": itemName, "ID": ""};

                    finalselectedItems.add(newEntryss);
                  });
                  Navigator.of(context).pop(); // Close the dialog.
                }
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }*/
}

class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries"
  ];

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          close(context, null);
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
