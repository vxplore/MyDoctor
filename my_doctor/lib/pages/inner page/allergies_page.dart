import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/service/global_variables.dart';

class AllergiesPage extends StatefulWidget {
  const AllergiesPage({super.key});

  @override
  State<AllergiesPage> createState() => _AllergiesPageState();
}

class _AllergiesPageState extends State<AllergiesPage> {
  // final List<Map<String, dynamic>> items = [];
  // List<Map<String, dynamic>> selectedItems = [];

  List<Map<String, dynamic>> getSelectedItemsByType(String targetType) {
    return globalVariables.selectedAllergy
        .where((item) => item["type"] == targetType)
        .toList();
  }

  void removeSelectedAllergyByType(String targetType) {
    setState(() {
      globalVariables.selectedAllergy
          .removeWhere((item) => item["type"] == targetType);
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 12),
        child: Column(
          children: [
            Container(
              width: 1.sw,
              // height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Environmental",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffC7C7C7)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Patient has any Environmental based allergy?",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffC7C7C7)),
                  ),
                  globalVariables.selectedAllergy
                          .where((item) => item["type"] == "environmental")
                          .isEmpty
                      ? Container(
                          width: 0,
                          height: 10,
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: ScrollPhysics(),
                          child: Container(
                            height: 60,
                            width: width,
                            child: Row(
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children:
                                      getSelectedItemsByType("environmental")
                                          .asMap()
                                          .entries
                                          .map((entry) {
                                    final int index = entry.key;
                                    final Map<String, dynamic> item =
                                        entry.value;

                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0),
                                            child: Text(
                                              item["name"],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.cancel_rounded,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              setState(
                                                () {
                                                  removeSelectedAllergyByType(
                                                      "environmental");
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                  InkWell(
                    onTap: () async {
                      await _showAddItemDialog("environmental");
                      /*if (newEntry != null) {
                        setState(() {
                          final newEntryss = {
                            "name": newEntry,
                            "type": "ENV_ALRG"
                            // Replace "New Item" with the desired name
                            // Assign a unique ID or use a dynamic method to generate one
                          };
                          // items.add(newItem);
                          items.add(newEntryss);
                          // selectedItems.add(newItem);
                          // filteredItems = items.where((item) => item.name.toLowerCase().contains(newEntry.toLowerCase())).toList();
                          // filteredItems = items.where((item) => item["NAME"].toLowerCase().contains(newEntry.toLowerCase())).toList();
                        });
                      }*/
                      // print("${selectedItems}");
                    },
                    child: Text(
                      "+ Add an Allergen",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1468B3),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey.shade300, thickness: 3),
                ],
              ),
            ),
            Container(
              width: 1.sw,
              // height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Food",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffC7C7C7)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Patient has any Food based allergy?",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffC7C7C7)),
                  ),
                  globalVariables.selectedAllergy
                          .where((item) => item["type"] == "food")
                          .isEmpty
                      ? Container(
                          width: 0,
                          height: 10,
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: ScrollPhysics(),
                          child: Container(
                            height: 60,
                            width: width,
                            child: Row(
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: getSelectedItemsByType("food")
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                    final int index = entry.key;
                                    final Map<String, dynamic> item =
                                        entry.value;

                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0),
                                            child: Text(
                                              item["name"],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.cancel_rounded,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              setState(
                                                () {
                                                  removeSelectedAllergyByType(
                                                      "food");
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                  InkWell(
                    onTap: () async {
                      await _showAddItemDialog("food");
                      /*if (newEntry != null) {
                        setState(() {
                          final newEntryss = {
                            "name": newEntry,
                            "type": "ENV_ALRG"
                            // Replace "New Item" with the desired name
                            // Assign a unique ID or use a dynamic method to generate one
                          };
                          // items.add(newItem);
                          items.add(newEntryss);
                          // selectedItems.add(newItem);
                          // filteredItems = items.where((item) => item.name.toLowerCase().contains(newEntry.toLowerCase())).toList();
                          // filteredItems = items.where((item) => item["NAME"].toLowerCase().contains(newEntry.toLowerCase())).toList();
                        });
                      }*/
                      // print("${selectedItems}");
                    },
                    child: Text(
                      "+ Add an Allergen",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1468B3),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey.shade300, thickness: 3),
                ],
              ),
            ),
            Container(
              width: 1.sw,
              // height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Drugs",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffC7C7C7)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Patient has any Drugs based allergy?",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffC7C7C7)),
                  ),
                  globalVariables.selectedAllergy
                          .where((item) => item["type"] == "drug")
                          .isEmpty
                      ? Container(
                          width: 0,
                          height: 10,
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: ScrollPhysics(),
                          child: Container(
                            height: 60,
                            width: width,
                            child: Row(
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: getSelectedItemsByType("drug")
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                    final int index = entry.key;
                                    final Map<String, dynamic> item =
                                        entry.value;

                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0),
                                            child: Text(
                                              item["name"],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.cancel_rounded,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              setState(
                                                () {
                                                  removeSelectedAllergyByType(
                                                      "drug");
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                  InkWell(
                    onTap: () async {
                      await _showAddItemDialog("drug");
                      /*if (newEntry != null) {
                        setState(() {
                          final newEntryss = {
                            "name": newEntry,
                            "type": "ENV_ALRG"
                            // Replace "New Item" with the desired name
                            // Assign a unique ID or use a dynamic method to generate one
                          };
                          // items.add(newItem);
                          items.add(newEntryss);
                          // selectedItems.add(newItem);
                          // filteredItems = items.where((item) => item.name.toLowerCase().contains(newEntry.toLowerCase())).toList();
                          // filteredItems = items.where((item) => item["NAME"].toLowerCase().contains(newEntry.toLowerCase())).toList();
                        });
                      }*/
                      // print("${selectedItems}");
                    },
                    child: Text(
                      "+ Add an Allergen",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1468B3),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey.shade300, thickness: 3),
                ],
              ),
            ),
            Container(
              width: 1.sw,
              // height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Other",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffC7C7C7)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Patient has any Other based allergy?",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffC7C7C7)),
                  ),
                  globalVariables.selectedAllergy
                          .where((item) => item["type"] == "other")
                          .isEmpty
                      ? Container(
                          width: 0,
                          height: 10,
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: ScrollPhysics(),
                          child: Container(
                            height: 60,
                            width: width,
                            child: Row(
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: getSelectedItemsByType("other")
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                    final int index = entry.key;
                                    final Map<String, dynamic> item =
                                        entry.value;

                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0),
                                            child: Text(
                                              item["name"],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.cancel_rounded,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              setState(
                                                () {
                                                  removeSelectedAllergyByType(
                                                      "other");
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                  InkWell(
                    onTap: () async {
                      await _showAddItemDialog("other");
                      /*if (newEntry != null) {
                        setState(() {
                          final newEntryss = {
                            "name": newEntry,
                            "type": "ENV_ALRG"
                            // Replace "New Item" with the desired name
                            // Assign a unique ID or use a dynamic method to generate one
                          };
                          // items.add(newItem);
                          items.add(newEntryss);
                          // selectedItems.add(newItem);
                          // filteredItems = items.where((item) => item.name.toLowerCase().contains(newEntry.toLowerCase())).toList();
                          // filteredItems = items.where((item) => item["NAME"].toLowerCase().contains(newEntry.toLowerCase())).toList();
                        });
                      }*/
                      // print("${selectedItems}");
                    },
                    child: Text(
                      "+ Add an Allergen",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1468B3),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey.shade300, thickness: 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> _showAddItemDialog(String alrgType) async {
    return showDialog<String>(
      context: context,
      builder: (context) {
        String? itemName; // Initialize itemName variable here.
        return AlertDialog(
          title: Text("Add Allergy"),
          content: TextField(
            decoration: InputDecoration(labelText: "Allergy Name"),
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
                    final newEntryss = {"name": itemName, "type": alrgType};
                    globalVariables.selectedAllergy.add(newEntryss);
                  });
                  Navigator.of(context).pop(); // Close the dialog.
                }
                var jsonStr = jsonEncode(globalVariables.selectedAllergy);
                print(
                    "${jsonStr}"); // Return the itemName.
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }
}
