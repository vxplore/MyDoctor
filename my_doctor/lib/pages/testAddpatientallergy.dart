import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchListDemo(),
    );
  }
}

/*class Item {
  final String name;

  Item(this.name);
}*/


class SearchListDemo extends StatefulWidget {
  @override
  _SearchListDemoState createState() => _SearchListDemoState();
}

class _SearchListDemoState extends State<SearchListDemo> {
  // Sample data for the initial list
/*final List<Item> items = [

  ];*/

  final List<Map<String,dynamic>> items = [
    /* {"NAME":"COLD",
      "TYPE":"001"},
    {"NAME":"DUST",
      "ID":"002"},*/
  ];
  /*List<Item> selectedItems = [];
  List<Item> filteredItems = [];*/

  List<Map<String,dynamic>> filteredItems = [];
  List<Map<String,dynamic>> selectedItems = [];
  List<Map<String, dynamic>> getSelectedItemsByType(String targetType) {
    return selectedItems.where((item) => item["TYPE"] == targetType).toList();
  }
  void removeSelectedAllergy(int index) {
    setState(() {
      selectedItems.removeAt(index);
    });
  }



  @override
  void initState() {
    super.initState();
    // Initially, display all items in the list.
    filteredItems = items;
  }

  void filterItems(String query) {
    setState(() {
/*filteredItems = items
          .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();*/

      filteredItems = items
          .where((item) => item["NAME"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search List Demo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Search input field
          /* Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filterItems,
              decoration: InputDecoration(
                hintText: "Search...",
              ),
            ),
          ),*/
          Container(height:40,),
          InkWell(onTap:() async {
            final newEntry = await _showAddItemDialog("ENV_ALRG");

            // final newEntry = await _showAddItemDialog();
            if (newEntry != null) {
              setState(() {
                // final newItem = Item(newEntry);

                final newEntryss = {
                  "NAME": newEntry,
                  "TYPE":"ENV_ALRG"// Replace "New Item" with the desired name
                  // Assign a unique ID or use a dynamic method to generate one
                };
                // items.add(newItem);
                items.add(newEntryss);
                // selectedItems.add(newItem);
                // filteredItems = items.where((item) => item.name.toLowerCase().contains(newEntry.toLowerCase())).toList();
                filteredItems = items.where((item) => item["NAME"].toLowerCase().contains(newEntry.toLowerCase())).toList();
              });
            }
          },child: Text("Add environment alergy")),
          // Text("Selected ENV_ALRG Allergies: ${getSelectedItemsByType("ENV_ALRG").map((item) => item["NAME"]).join(', ')}"),
          Text("Selected ENV_ALRG Allergies:"),
          SingleChildScrollView(scrollDirection: Axis.horizontal,physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                Wrap(direction: Axis.horizontal,
                  children: getSelectedItemsByType("ENV_ALRG").asMap().entries.map((entry) {
                    final int index = entry.key;
                    final Map<String, dynamic> item = entry.value;

                    return Container(
                      decoration: BoxDecoration(color: Colors.green,
                          border: Border.all(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(item["NAME"]),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              removeSelectedAllergy(index);
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
          Container(height:40,),

          InkWell(onTap:() async {
            final newEntry = await _showAddItemDialog("FOOD_ALRG");

            // final newEntry = await _showAddItemDialog();
            if (newEntry != null) {
              setState(() {
                // final newItem = Item(newEntry);

                final newEntryss = {
                  "NAME": newEntry,
                  "TYPE":"FOOD_ALRG"// Replace "New Item" with the desired name
                  // Assign a unique ID or use a dynamic method to generate one
                };
                // items.add(newItem);
                items.add(newEntryss);
                // selectedItems.add(newItem);
                // filteredItems = items.where((item) => item.name.toLowerCase().contains(newEntry.toLowerCase())).toList();
                filteredItems = items.where((item) => item["NAME"].toLowerCase().contains(newEntry.toLowerCase())).toList();
              });
            }
          },child: Text("Add food alergy")),
          Text("Selected FOOD_ALRG Allergies: ${getSelectedItemsByType("FOOD_ALRG").map((item) => item["NAME"]).join(', ')}"),
          Container(height:40,),
          InkWell(onTap:() async {
            final newEntry = await _showAddItemDialog("DRUG_ALRG");

            // final newEntry = await _showAddItemDialog();
            if (newEntry != null) {
              setState(() {
                // final newItem = Item(newEntry);

                final newEntryss = {
                  "NAME": newEntry,
                  "TYPE":"DRUG_ALRG"// Replace "New Item" with the desired name
                  // Assign a unique ID or use a dynamic method to generate one
                };
                // items.add(newItem);
                items.add(newEntryss);
                // selectedItems.add(newItem);
                // filteredItems = items.where((item) => item.name.toLowerCase().contains(newEntry.toLowerCase())).toList();
                filteredItems = items.where((item) => item["NAME"].toLowerCase().contains(newEntry.toLowerCase())).toList();
              });
            }
          },child: Text("Add drug alergy")),
          Text("Selected DRUG_ALRG Allergies: ${getSelectedItemsByType("DRUG_ALRG").map((item) => item["NAME"]).join(', ')}"),
          Container(height:40,),
          InkWell(onTap:() async {
            final newEntry = await _showAddItemDialog("OTHER_ALRG");

            // final newEntry = await _showAddItemDialog();
            if (newEntry != null) {
              setState(() {
                // final newItem = Item(newEntry);

                final newEntryss = {
                  "NAME": newEntry,
                  "TYPE":"OTHER_ALRG"// Replace "New Item" with the desired name
                  // Assign a unique ID or use a dynamic method to generate one
                };
                // items.add(newItem);
                items.add(newEntryss);
                // selectedItems.add(newItem);
                // filteredItems = items.where((item) => item.name.toLowerCase().contains(newEntry.toLowerCase())).toList();
                filteredItems = items.where((item) => item["NAME"].toLowerCase().contains(newEntry.toLowerCase())).toList();
              });
            }
          },child: Text("Add others alergy")),
          Text("Selected OTHER_ALRG Allergies: ${getSelectedItemsByType("OTHER_ALRG").map((item) => item["NAME"]).join(', ')}"),
          ElevatedButton(onPressed: (){
            print("${selectedItems}");
          }, child: Text("Chexck")),
          // List of search results with checkboxes
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: filteredItems.length,
          //     itemBuilder: (context, index) {
          //       final item = filteredItems[index];
          //       final isSelected = selectedItems.contains(item);
          //
          //       return ListTile(
          //         title: Text(item["NAME"]),
          //         trailing: Checkbox(
          //           value: isSelected,
          //           onChanged: (value) {
          //             setState(() {
          //               if (value == true) {
          //                 selectedItems.add(item);
          //               } else {
          //                 selectedItems.remove(item);
          //               }
          //             });
          //           },
          //         ),
          //       );
          //     },
          //   ),
          // ),
          // Display the selected items

        ],
      ),
    );
  }

  Future<String?> _showAddItemDialog(String alrgType) async {
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
                    // final newItem = Item(itemName!);
                    // items.add(newItem);
                    //                    selectedItems.add(newItem);

                    final newEntryss = {
                      "NAME": itemName,
                      "TYPE":alrgType// Replace "New Item" with the desired name
                      // Assign a unique ID or use a dynamic method to generate one
                    };
                    items.add(newEntryss);
                    selectedItems.add(newEntryss);
                    filteredItems = items; // Update filteredItems to show all items
                  });
                  Navigator.of(context).pop(); // Close the dialog.
                }
                print("${selectedItems}");// Return the itemName.
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

}
