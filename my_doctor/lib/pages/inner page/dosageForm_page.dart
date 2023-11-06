import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/custom%20widget/custom_circularProgress.dart';

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
      body: globalVariables.getDosageForm == null
          ? MyCircularIndicator()
          : Padding(
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
                              style: TextStyle(
                                  fontSize: 21, color: Color(0xffA5A5A5)),
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
                  GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        mainAxisExtent: 55),
                    itemCount: globalVariables.getDosageForm!.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 100,
                        // height: 500,
                        // width: 500,
                        width: 70,
                        // color: Colors.red,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              // dosageform = "Tablet";
                              // globalVariables.dosageform = "Tablet";
                              globalVariables.dosageform = globalVariables
                                  .getDosageForm!.data[index].type;
                              globalVariables.dosageFormId =
                                  globalVariables.getDosageForm!.data[index].id;
                              globalVariables.nameId = null;
                              globalVariables.doseId = null;
                              globalVariables.dose = null;
                              globalVariables.names = null;
                              widget.onNext();
                            });
                            // print("button pressed: ${dosageform}");
                            print(
                                "button pressed: ${globalVariables.dosageform}");
                            print(
                                "button pressed: ${globalVariables.dosageFormId}");
                          },
                          child: Container(
                            height: 50,
                            width: 120,
                            // width: 70,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                              elevation: 5,
                              child: Container(
                                // padding: EdgeInsets.only(left: 7, right: 7),
                                height: 80,
                                // height: 70,
                                width: 150,
                                // width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    // "Tablet",
                                    globalVariables
                                        .getDosageForm!.data[index].type,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff5A88BB),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
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
