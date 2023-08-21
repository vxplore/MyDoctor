import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchForLaboratoryPage extends StatefulWidget {
  const SearchForLaboratoryPage({super.key});

  @override
  State<SearchForLaboratoryPage> createState() =>
      _SearchForLaboratoryPageState();
}

class _SearchForLaboratoryPageState extends State<SearchForLaboratoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          "Search for Laboratory",
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
          SizedBox(
            height: 100,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.medication,
                  color: Color(0xffC9C9C9),
                  size: 250,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 125,right: 120),
                  child: Text(textAlign: TextAlign.center,
                    "No Laboratory available",
                    style: TextStyle(fontSize: 23, color: Color(0xffC5C5C5)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 160,
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
        ],
      ),
    );
  }
}

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
