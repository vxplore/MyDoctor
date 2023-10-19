import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchBarDemo(),
    );
  }
}

class SearchBarDemo extends StatefulWidget {
  @override
  _SearchBarDemoState createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  final List<Map<String, dynamic>> items = [
    {'name': 'Apple', 'ID': '001'},
    {'name': 'Strawberry', 'ID': '002'},
    {'name': 'Orange', 'ID': '003'},
    {'name': 'Kiwi', 'ID': '004'},
    {'name': 'Grapes', 'ID': '005'},
  ];

  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> selectedItems = [];
  List<Map<String, dynamic>> finalselectedItems = [];
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
            noSearch = true;
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Bar Demo'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              onChanged: _filterItems,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Search for an item',
                prefixIcon: Icon(Icons.search,color: Color(0xffDFDFDF), size: 40),
              ),
            ),
          ),
          Visibility(
            visible: showSearchResults,
            child: Container(
                height: 195,
                child: noSearch == false
                    ? ListView.builder(
                  itemCount: selectedItems.length,
                  itemBuilder: (context, index) {
                    final item = selectedItems[index];
                    final itemName = item['name'] as String;
                    final itemId = item['ID'] as String;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          finalselectedItems
                              .add({"name": itemName, "ID": itemId});
                          print(finalselectedItems);
                        });
                      },
                      child: ListTile(
                        title: Text(itemName),
                      ),
                    );
                  },
                )
                    : Text("No result found")),
          ),
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: finalselectedItems.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text(finalselectedItems[index]["name"]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          finalselectedItems.removeAt(index);
                        }); // Call the delete function when the delete button is clicked
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          InkWell(onTap: (){
            _showAddItemDialog();
          },child: Text("ADD ITEMS")),
          InkWell(
              onTap: () {
                print(finalselectedItems);
              },
              child: Text("CHECK")),
        ],
      ),
    );
  }

  Future<String?> _showAddItemDialog() async {
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
  }
}
