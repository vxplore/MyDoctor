import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../service/global_variables.dart';
import '../patient_complaints_page.dart';

class DosageFormPage extends StatefulWidget {
  const DosageFormPage({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;

  @override
  State<DosageFormPage> createState() => _DosageFormPageState();
}

class _DosageFormPageState extends State<DosageFormPage> {
  // String? dosageform;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 19, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Dosages Form',
              style: TextStyle(color: Color(0xff0266D5), fontSize: 25),
            ),
            const SizedBox(height: 16),
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
                        "Search Dosages Form",
                        style:
                        TextStyle(fontSize: 21, color: Color(0xffA5A5A5)),
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
              height: 25,
            ),
            Container(
              height: 70,
              width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        // dosageform = "Tablet";
                        globalVariables.dosageform = "Tablet";
                        widget.onNext();
                      });
                      // print("button pressed: ${dosageform}");
                      print("button pressed: ${globalVariables.dosageform}");
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25))),
                        elevation: 5,
                        child: Container(
                          // padding: EdgeInsets.only(left: 7, right: 7),
                          height: 80,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Tablet",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        // dosageform = "Capsule";
                        globalVariables.dosageform = "Capsule";
                        widget.onNext();
                      });
                      // print("button pressed: ${dosageform}");
                      print("button pressed: ${globalVariables.dosageform}");
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25))),
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(left: 7, right: 7),
                          height: 80,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Capsule",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        // dosageform = "Syrup";
                        globalVariables.dosageform = "Syrup";
                        widget.onNext();
                      });
                      // print("button pressed: ${dosageform}");
                      print("button pressed: ${globalVariables.dosageform}");
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25))),
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(left: 7, right: 7),
                          height: 80,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Syrup",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /*for (var item in Experience.values)
              RadioListTile<Experience>(
                title: Text(_experienceTitles[item]!),
                value: item,
                groupValue: _experience,
                onChanged: (value) {
                  setState(() => _experience = value);
                },
              ),*/
            const Spacer(),
            /*  PrimaryButton(
              onPressed: _experience != null ? widget.onNext : null,
              text: 'Next',
            ),*/
          ],
        ),
      ),
    );
  }
}
