import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../service/global_variables.dart';
import '../patient_complaints_page.dart';

class DosePage extends StatefulWidget {
  const DosePage({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;

  @override
  State<DosePage> createState() => _DosePageState();
}

class _DosePageState extends State<DosePage> {
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
              'Dose',
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
                        "Search Dose",
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
            GridView.builder(
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 55),
              itemCount:
                  globalVariables.getMedicineDosageQuantity!.data.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 70,
                  width: 500,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        // globalVariables.dose = "100mg";
                        globalVariables.dose = globalVariables
                            .getMedicineDosageQuantity!.data.data[index].dose;
                        globalVariables.doseId = globalVariables
                            .getMedicineDosageQuantity!.data.data[index].id;
                        widget.onNext();
                      });
                      print("button pressed: ${globalVariables.dose}");
                      print("button pressed: ${globalVariables.doseId}");
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
                              // "100mg",
                              globalVariables.getMedicineDosageQuantity!.data
                                  .data[index].dose,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
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
