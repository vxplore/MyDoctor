import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/pages/additionalAssesment_page.dart';
import 'package:my_doctor/pages/dashboardPage.dart';
import 'package:my_doctor/pages/dashboard_page.dart';
import 'package:my_doctor/pages/myPatient_page.dart';
import 'package:my_doctor/service/navigation_service.dart';

import 'chief_complaintsDetails_page.dart';

class PatientComplaintsPage extends StatefulWidget {
  const PatientComplaintsPage({super.key});

  @override
  State<PatientComplaintsPage> createState() => _PatientComplaintsPageState();
}

class _PatientComplaintsPageState extends State<PatientComplaintsPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        NavigationService().replaceScreen(DashboardPage());
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xffF3FBFF),
        appBar: AppBar(
          backgroundColor: Color(0xff1468B3),
          toolbarHeight: 70,
          leading: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 35,
          ),
          title: Text(
            "Nitish Complaints",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 14, top: 20),
              child: InkWell(
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
                  width: 390,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Search for Complaints",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xffBBBBBB)),
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
            ),
            Padding(
              padding: EdgeInsets.only(left: 19, top: 25),
              child: Text(
                "Complaints",
                style: TextStyle(fontSize: 24, color: Color(0xffC4C4C4)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChiefComplaintsDetailsPage()),
              );
            },
              child: Container(
                height: 65,
                width: 420,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 20, right: 18),
                  child: Text(
                    "Tooth pain",
                    style: TextStyle(fontSize: 18, color: Color(0xffBBBBBB)),
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.all(17),
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                 NavigationService().navigateToScreen(AdditionalAssesmentPage());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff1468B3),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4))),
                child: const Text("Skip"),
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
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
