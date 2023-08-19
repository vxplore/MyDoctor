import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom widget/button.dart';

class RecomandedLabTestPage extends StatefulWidget {
  const RecomandedLabTestPage({super.key});

  @override
  State<RecomandedLabTestPage> createState() => _RecomandedLabTestPageState();
}

class _RecomandedLabTestPageState extends State<RecomandedLabTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      appBar: AppBar(
        backgroundColor: Color(0xff1468B3),
        toolbarHeight: 90,
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
          size: 35,
        ),
        title: Text(
          "Recommend LAB TEST",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, color: Color(0xffDBDBDB)),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate());
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xffDFD0D0), // Border color
                  width: 0.5, // Border width
                ),
              ),
              height: 70,
              width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 19),
                    child: Text(
                      "Search for Lab Test",
                      style: TextStyle(fontSize: 18, color: Color(0xffBBBBBB)),
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
              ),
            ),
          ),
          Container(
            height: 70,
            width: 500,
            child: Padding(
              padding: const EdgeInsets.only(left: 19, top: 25),
              child: Text(
                "Lipid Profile",
                style: TextStyle(fontSize: 18, color: Color(0xff9F9F9F)),
              ),
            ),
          ),
          Divider(
            color: Color(0xffCBCBCB),
            thickness: 0.5,
          ),
          Container(
            height: 70,
            width: 500,
            child: Padding(
              padding: const EdgeInsets.only(left: 19, top: 25),
              child: Text(
                "Stool Analysis",
                style: TextStyle(fontSize: 18, color: Color(0xff9F9F9F)),
              ),
            ),
          ),
          Divider(
            color: Color(0xffCBCBCB),
            thickness: 0.5,
          ),
          Container(
            height: 70,
            width: 500,
            child: Padding(
              padding: const EdgeInsets.only(left: 19, top: 25),
              child: Text(
                "HbA1c (Glycosylated Hemoglobin)",
                style: TextStyle(fontSize: 18, color: Color(0xff9F9F9F)),
              ),
            ),
          ),
          Divider(
            color: Color(0xffCBCBCB),
            thickness: 0.5,
          ),
          SizedBox(
            height: 250,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              textAlign: TextAlign.center,
              "+ Suggest Laboratory",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
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
                onPressed: () {},
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
            height: 24,
          ),
        ],
      ),
    );
  }
}

/*Lipid Profile Stool Analysis HbA1c (Glycosylated Hemoglobin)*/

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
