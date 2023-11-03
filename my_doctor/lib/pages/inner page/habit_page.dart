import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../service/global_variables.dart';

class HabitPage extends StatefulWidget {
  const HabitPage({super.key});

  @override
  State<HabitPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HabitPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 12),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            globalVariables.selectedHabits.isNotEmpty
                ? Container(
                    width: 0,
                    height: 0,
                  )
                : Text(
                    "you have not added any patient's habit",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffC7C7C7)),
                  ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                await _showAddItemDialog();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: Color(0xff1468B3),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "ADD HABIT",
                    style: TextStyle(
                        color: Color(0xff1468B3), fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: globalVariables.selectedHabits.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape:
                        BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.only(left: 14, right: 7),
                      height: 80,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 17, bottom: 13),
                            child: Text(
                              // "Tablet",
                              "${globalVariables.selectedHabits[index]}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff0266D5)),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 16, top: 26, bottom: 26),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  globalVariables.selectedHabits
                                      .removeAt(index);
                                });
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> _showAddItemDialog() async {
    return showDialog<String>(
      context: context,
      builder: (context) {
        String? itemName; // Initialize itemName variable here.
        return AlertDialog(
          title: Text("Add Habit"),
          content: TextField(
            decoration: InputDecoration(labelText: "Habit Name"),
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
                    globalVariables.selectedHabits.add(itemName!);
                  });
                  Navigator.of(context).pop(); // Close the dialog.
                }
                globalVariables.selectedHabitsJson = jsonEncode(globalVariables.selectedHabits);
                print(
                    "${globalVariables.selectedHabitsJson}"); // Return the itemName.
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }
}
