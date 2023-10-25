import 'package:flutter/material.dart';

class FindingsPage extends StatefulWidget {
  const FindingsPage({super.key});

  @override
  State<FindingsPage> createState() => _FindingsPageState();
}

class _FindingsPageState extends State<FindingsPage> {
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
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
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
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 35,
            ),
          ),
          title: Text(
            "Findings",
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
                      child: TextFormField(
                        controller: _controller,
                        onChanged: _filterItems,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelStyle:
                              TextStyle(fontSize: 18, color: Color(0xffBBBBBB)),
                          labelText: '  Search for Findings',
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
                                      finalselectedItems.add(
                                          {"name": itemName, "ID": itemId});
                                      print(finalselectedItems);
                                    });
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
                                      setState(() {
                                        final newEntryss = {
                                          "name": _controller.text,
                                          "ID": ""
                                        };

                                        finalselectedItems.add(newEntryss);
                                      });
                                    },
                                    child: Text(
                                        "Click here to add this as new finding",
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
                Padding(
                  padding: EdgeInsets.only(left: 19, top: 25),
                  child: Text(
                    "Findings",
                    style: TextStyle(fontSize: 24, color: Color(0xffC4C4C4)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
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
                Spacer(),
                InkWell(
                  onTap: () {
                    debugPrint("findings: $finalselectedItems");
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.all(17),
                    width: double.infinity,
                    height: 55,
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff1468B3),
                            Colors.greenAccent
                          ], // Adjust the colors as needed
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 55,
                        alignment: Alignment.center,
                        child: Text(
                          "Done",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
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
}
