import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/pages/addMedication_page.dart';
import 'package:my_doctor/pages/additionalAssesment_page.dart';
import 'package:my_doctor/pages/dashboardPage.dart';
import 'package:my_doctor/pages/main_dashboard_page.dart';
import 'package:my_doctor/pages/myPatient_page.dart';
import 'package:my_doctor/pages/patient_prescription_page.dart';
import 'package:my_doctor/service/navigation_service.dart';

import '../service/global_variables.dart';
import 'chief_complaintsDetails_page.dart';

class SuggestPharmacyPage extends StatefulWidget {
  const SuggestPharmacyPage({super.key});

  @override
  State<SuggestPharmacyPage> createState() => _SuggestPharmacyPageState();
}

class _SuggestPharmacyPageState extends State<SuggestPharmacyPage> {
  final List<Map<String, dynamic>> items = [
    {'name': 'Apple', 'ID': '001', "phone": "235355554"},
    {'name': 'Strawberry', 'ID': '002', "phone": "23535559"},
    {'name': 'Orange', 'ID': '003', "phone": "235355552"},
    {'name': 'Kiwi', 'ID': '004', "phone": "235355551"},
    {'name': 'Grapes', 'ID': '005', "phone": "235355550"},
  ];

  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> selectedItems = [];
  List<Map<String, dynamic>> finalselectedItems = [];
  Map<String, dynamic> selectedPharmacy = {};
  bool showSearchResults = false;
  bool noSearch = false;

  void _filterItems(String query) {
    setState(() {
      selectedItems.clear();

      if (query.isNotEmpty) {
        String lowercaseQuery = query.toLowerCase();
        for (Map<String, dynamic> item in items) {
          final itemName = item['name'] as String;
          if (itemName.toLowerCase().contains(lowercaseQuery)) {
            selectedItems.add(item);
            noSearch = false;
          } else {
            noSearch = !noSearch;
          }
        }
        showSearchResults = true;
      } else {
        showSearchResults = false;
      }
    });
  }

  void _filterItems2(String query) {
    setState(() {
      selectedItems.clear();

      if (query.isNotEmpty) {
        String lowercaseQuery = query.toLowerCase();
        for (Map<String, dynamic> item in items) {
          final itemName = item['name'] as String;
          if (itemName.toLowerCase().contains(lowercaseQuery)) {
            selectedItems.add(item);
            noSearch = !noSearch;
          }
          if (!itemName.toLowerCase().contains(lowercaseQuery)){
            noSearch = false;
          }
        }
        showSearchResults = true;
      } else {
        showSearchResults = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        /* Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PatientPrescriptionPage(
                  globalVariables.patientName!,
                  globalVariables.patientAge!,
                  globalVariables.patientAgeType!,
                  globalVariables.patientsGender!,
                  globalVariables.patientImg!)),
        );*/
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
              /*  Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PatientPrescriptionPage(
                        globalVariables.patientName!,
                        globalVariables.patientAge!,
                        globalVariables.patientAgeType!,
                        globalVariables.patientsGender!,
                        globalVariables.patientImg!)),
              );*/
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 35,
            ),
          ),
          title: Text(
            "Suggest Pharmacy",
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
                    child:
                    /* Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Search for Complaints",
                            style:
                                TextStyle(fontSize: 18, color: Color(0xffBBBBBB)),
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
                    ),*/
                    FocusScope(
                      child: TextFormField(
                        controller: _controller,
                        onChanged:
                        noSearch != true ? _filterItems : _filterItems2,
                        decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.only(left: 20.0, top: 15, bottom: 10),
                          isDense: true,
                          border: InputBorder.none,
                          labelStyle:
                          TextStyle(fontSize: 18, color: Color(0xffBBBBBB)),
                          labelText: 'Search for Pharmacy',
                          suffixIcon: showSearchResults == false
                              ? Icon(Icons.search,
                              color: Color(0xffDFDFDF), size: 40)
                              : InkWell(
                            onTap: () {
                              _controller.clear();
                              _filterItems('');
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
                Visibility(
                  visible: showSearchResults,
                  child: Expanded(
                    child: Container(
                      // height: 195,
                        child: noSearch == false
                            ? ListView.builder(
                          itemCount: selectedItems.length,
                          itemBuilder: (context, index) {
                            final item = selectedItems[index];
                            final itemName = item['name'] as String;
                            final itemId = item['ID'] as String;
                            final itemPh = item["phone"] as String;
                            return InkWell(
                              onTap: () {
                                /* setState(() {
                                        finalselectedItems.add(
                                            {"name": itemName, "ID": itemId});
                                        print(finalselectedItems);
                                      });*/
                                if (!finalselectedItems.any(
                                        (selectedItem) =>
                                    (selectedItem['name']
                                    as String) ==
                                        itemName)) {
                                  setState(() {
                                    finalselectedItems.add({
                                      "name": itemName,
                                      "ID": itemId,
                                      "phone": itemPh
                                    });
                                    print(finalselectedItems);
                                    showSearchResults = false;
                                    _controller.clear();
                                    FocusScope.of(context).unfocus();
                                  });
                                }
                              },
                              child: ListTile(
                                title: Text(itemName),
                              ),
                            );
                          },
                        )
                            : Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("No result found"),
                              InkWell(
                                onTap: () {
                                  /* setState(() {
                                          final newEntryss = {
                                            "name": _controller.text,
                                            "ID": ""
                                          };

                                          finalselectedItems.add(newEntryss);
                                        });*/
                                  if (!finalselectedItems.any(
                                          (selectedItem) =>
                                      (selectedItem['name']
                                      as String) ==
                                          _controller.text)) {
                                    /*  setState(() {
                                      finalselectedItems
                                          .add({"name": _controller.text, "ID": ""});
                                      print(finalselectedItems);
                                      _controller.clear();
                                      FocusScope.of(context).unfocus();
                                      showSearchResults = false;
                                    });*/
                                    _showAddItemDialog();
                                  }
                                },
                                child: Text(
                                    "Click here to add this as new pharmacy",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        decoration:
                                        TextDecoration.underline)),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 19, top: 25),
                  child: Text(
                    "Pharmacy",
                    style: TextStyle(fontSize: 24, color: Color(0xffC4C4C4)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                /*InkWell(
                  onTap: () {
                   */ /* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChiefComplaintsDetailsPage()),
                    );*/ /*
                  },
                  child: Container(
                    height: 65,
                    width: 420,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, top: 20, right: 18),
                      child: Text(
                        "Tooth pain",
                        style: TextStyle(fontSize: 18, color: Color(0xffBBBBBB)),
                      ),
                    ),
                  ),
                ),*/
                Container(
                  padding: EdgeInsets.all(12),
                  height: showSearchResults == false ? 480 : 290,
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
                                    selectedPharmacy.addAll({
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
                      print("selected pharmacy :$selectedPharmacy");
                      globalVariables.pharmacynamess = selectedPharmacy["name"];
                      NavigationService()
                          .navigateToScreen(AddMedicationPage(pharmacyname: globalVariables.pharmacynamess! ,));
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
    return showDialog<String>(
      context: context,
      builder: (context) {
        String? itemName = _controller.text; // Initialize itemName variable here.
        String? itemName2;
        return AlertDialog(
          title: Text("Add New Pharmacy"),
          content: Container(
            height: 150,
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(labelText: "Pharmacy Name"),
                  onChanged: (value) {
                    itemName = value; // Assign the entered value to itemName.
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Pharmacy Phone"),
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
                /* if (_controller.text!=""&&itemName != null &&
                    itemName!.isNotEmpty &&
                    itemName2 != null &&
                    itemName2!.isNotEmpty)*/ {
                  setState(() {
                    final newEntryss = {
                      "name": itemName,
                      "ID": "",
                      "phone": itemName2
                    };

                    finalselectedItems.add(newEntryss);
                  });
                  print(finalselectedItems);
                  _controller.clear();
                  FocusScope.of(context).unfocus();
                  showSearchResults = false;
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

/*
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
      },*/
/**//*

    );
  }
}*/
