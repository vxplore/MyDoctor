/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/pages/addPatient_page.dart';
import 'package:my_doctor/pages/additionalAssesment_page.dart';
import 'package:my_doctor/pages/intro_page.dart';
import 'package:my_doctor/pages/login_page.dart';
import 'package:my_doctor/pages/myPatient_page.dart';
import 'package:my_doctor/pages/otp_page.dart';
import 'package:my_doctor/pages/professionalDetails_page.dart';
import 'package:my_doctor/pages/registration_page.dart';
import 'package:my_doctor/pages/splash_page.dart';
import 'package:my_doctor/service/navigation_service.dart';

import 'core/di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: false,
      designSize: const Size(412, 778),
      // scaleByHeight: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) => MaterialApp(
        navigatorKey: NavigationService().navigationKey,
        debugShowCheckedModeBanner: false,
        title: 'My Doctor',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
*/

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
    {"NAME":"COLD",
    "ID":"001"},
    {"NAME":"DUST",
      "ID":"002"},
  ];
/*
  List<Item> selectedItems = [];
  List<Item> filteredItems = [];*/
   List<Map<String,dynamic>> filteredItems = [];
   List<Map<String,dynamic>> selectedItems = [];

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
        children: [
          // Search input field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filterItems,
              decoration: InputDecoration(
                hintText: "Search...",
              ),
            ),
          ),
          InkWell(onTap:() async {
           /* final newEntry = await _showAddItemDialog();*/
             final newEntry = await _showAddItemDialog();
            if (newEntry != null) {
              setState(() {
             /*   final newItem = Item(newEntry);*/
                final newEntryss = {
                  "NAME": newEntry,
                  "ID":""// Replace "New Item" with the desired name
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
          Text("Selected Items: ${selectedItems.map((item) => item["NAME"]).join(', ')}"),
          ElevatedButton(onPressed: (){
            print("${selectedItems}");
          }, child: Text("Chexck")),
          // List of search results with checkboxes
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                final isSelected = selectedItems.contains(item);

                return ListTile(
                  title: Text(item["NAME"]),
                  trailing: Checkbox(
                    value: isSelected,
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          selectedItems.add(item);
                        } else {
                          selectedItems.remove(item);
                        }
                      });
                    },
                  ),
                );
              },
            ),
          ),
          // Display the selected items

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
                    // final newItem = Item(itemName!);
                   /* items.add(newItem);
                    selectedItems.add(newItem);*/
                    final newEntryss = {
                      "NAME": itemName,
                      "ID":""// Replace "New Item" with the desired name
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
