/*
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDropdown(),
    );
  }
}

class MyDropdown extends StatefulWidget {
  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  List<Map<String, dynamic>> dropValues = [
    {"name": "Apple", "id": "001", "isSelected": false},
    {"name": "Orange", "id": "002", "isSelected": false},
    {"name": "Banana", "id": "003", "isSelected": true}
  ];
  String selectedItem = "";
  // Default selected item

  @override
  Widget build(BuildContext context) {
    String selectedItemId = dropValues
        .firstWhere((item) => item["isSelected"] == true)["id"];
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Item Dropdown'),
      ),
      body: Center(
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedItemId,
              onChanged: (String? newValue) {
                setState(() {
                  selectedItemId = newValue!;
                  for (var item in dropValues) {
                    item["isSelected"] = item["id"] == selectedItemId;
                  }
                });
              },
              items: dropValues.map((item) {
                return DropdownMenuItem<String>(
                  value: item["id"],
                  child: Text(item["name"]),
                );
              }).toList(),
            ),
            Text(
              'Selected Value: ${dropValues.firstWhere((item) => item["id"] == selectedItemId)["name"]}',
              style: TextStyle(fontSize: 16),
            ),
            InkWell(onTap: (){
              selectedItem =dropValues.firstWhere((item) => item["id"] == selectedItemId)["id"];
              print("selected itemID: $selectedItem");
            },child: Text("CHECK")),
          ],
        ),
      ),
    );
  }
}
*/
