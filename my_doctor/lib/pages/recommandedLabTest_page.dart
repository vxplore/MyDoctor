import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/pages/prescription_webview_page.dart';
import 'package:my_doctor/pages/searchForLaboratory_page.dart';
import 'package:my_doctor/pages/suggest_laboratory_page.dart';

import '../custom widget/button.dart';

class RecommendedLabTestPage extends StatefulWidget {
  final String labname;

  const RecommendedLabTestPage({super.key, required this.labname});

  @override
  State<RecommendedLabTestPage> createState() => _RecommendedLabTestPageState();
}

class _RecommendedLabTestPageState extends State<RecommendedLabTestPage> {
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
          MaterialPageRoute(builder: (context) => PrescriptionWebViewPage()),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xffF6F6F6),
        appBar: AppBar(
          backgroundColor: Color(0xff1468B3),
          toolbarHeight: 90,
          leading: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PrescriptionWebViewPage()),
              );
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 35,
            ),
          ),
          title: Text(
            "Recommended LAB TEST",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, color: Color(0xffDBDBDB)),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 760,
            width: 500,
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
                          labelText: 'Search for Lab Test',
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
                        height: 125,
                        width: 500,
                        child: _foundUsers.isNotEmpty
                            ? ListView.builder(
                                itemCount: _foundUsers.length,
                                itemBuilder: (context, index) => ListTile(
                                  onTap: () {
                                    /*setState(() {
                                        finalselectedItems.add(
                                          {
                                            "name": _foundUsers[index]["name"],
                                            "ID": _foundUsers[index]["ID"],
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
                                  /*setState(() {
                                      finalselectedItems.add(
                                        {
                                          "name": _searchController.text,
                                          "ID": ""
                                        },
                                      );
                                      _searchController.clear();
                                      FocusScope.of(context).unfocus();
                                    });*/
                                  bool isDuplicate = finalselectedItems.any(
                                      (item) =>
                                          item["name"] ==
                                          _searchController.text);

                                  if (!isDuplicate) {
                                    setState(() {
                                      finalselectedItems.add(
                                        {
                                          "name": _searchController.text,
                                          "ID": "",
                                        },
                                      );
                                      items.add(
                                        {
                                          "name": _searchController.text,
                                          "ID": "",
                                        },
                                      );
                                      _searchController.clear();
                                      FocusScope.of(context).unfocus();
                                    });
                                  }
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'No results found. Click here to add as new Lab Test',
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
                    "Lab Tests",
                    style: TextStyle(fontSize: 24, color: Color(0xffC4C4C4)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  height: _searchController.text != "" ? 285 : 425,
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
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuggestLaboratoryPage()),
                      );
                    },
                    child: Column(
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          "+ Suggest Laboratory",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "${widget.labname}",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.only(left: 19, right: 18),
                    height: 70,
                    width: 500,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          padding: const EdgeInsets.all(12),
                          backgroundColor: Color(0xff1468B3)),
                      onPressed: () {
                        print("$finalselectedItems");
                      },
                      child: Text(
                        "Done",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*Lipid Profile Stool Analysis HbA1c (Glycosylated Hemoglobin)*/
