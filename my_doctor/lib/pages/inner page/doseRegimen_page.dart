import 'package:flutter/material.dart';

import '../../custom widget/medicationConsumeDialog.dart';
import '../../service/global_variables.dart';
import '../patient_complaints_page.dart';

class DoseRegimenPage extends StatefulWidget {
  const DoseRegimenPage({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;

  @override
  State<DoseRegimenPage> createState() => _DoseRegimenPageState();
}

class _DoseRegimenPageState extends State<DoseRegimenPage> {
  /* String? _doseregimen;
  String? _dataFromDialog;*/
  bool isBeaforeMealClicked = false;
  bool isAfterMealClicked = false;
  bool isWithMealClicked = false;
  bool isNAClicked = false;
  bool isButtonClicked = false;
  String medicineConsume = "";

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
              'Dose Regimen',
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
                        "Search for Dose Regimen",
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
                  globalVariables.getMedicineDosageRegimen!.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 70,
                  width: 500,
                  child: InkWell(
                    onTap: () async {
                      globalVariables.dataFromDialogdoseregimen =
                          await showDialog(
                              context: context,
                              builder: (context) => ourDialog(),
                              barrierDismissible: false);
                      setState(() {
                        // globalVariables.doseregimen = "Twice Daily (1-0-1)";
                        globalVariables.doseregimen = globalVariables
                            .getMedicineDosageRegimen!.data[index].regimen;
                        globalVariables.doseregimenId = globalVariables
                            .getMedicineDosageRegimen!.data[index].id;
                      });
                      print("button pressed: ${globalVariables.doseregimen}");
                      print("button pressed: ${globalVariables.doseregimenId}");
                      print(
                          "button pressed: ${globalVariables.dataFromDialogdoseregimen}");
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        elevation: 5,
                        child: Container(
                          // padding: EdgeInsets.only(left: 7, right: 7),
                          height: 80,

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
                              // "Twice Daily (1-0-1)",
                              globalVariables.getMedicineDosageRegimen!
                                  .data[index].regimen,
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
            SizedBox(
              height: 20,
            ),
            globalVariables.doseregimen == null
                ? Container(
                    height: 1,
                    width: 1,
                    color: Colors.white,
                  )
                : Container(
                    height: 150,
                    width: 500,
                    child: Card(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.only(left: 14, right: 7),
                        height: 80,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Dose Regiment",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${globalVariables.doseregimen}",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 22, color: Colors.green),
                            ),
                            Text(
                              "How to Consume",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${globalVariables.dataFromDialogdoseregimen}",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 22, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            /* const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 55,
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
                  onPressed: globalVariables.doseregimen != null
                      ? widget.onNext
                      : null,
                  child: Text(
                    "Done",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  Widget ourDialog() {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Dialog(
        child: Container(
          height: 320,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Padding(
            padding: const EdgeInsets.all(19.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    textAlign: TextAlign.center,
                    "When should the medication be consumed?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 120,
                  width: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                medicineConsume = "Before Meal";
                                isBeaforeMealClicked = true;
                                isAfterMealClicked = false;
                                isWithMealClicked = false;
                                isNAClicked = false;
                                isButtonClicked = true;
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 145,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                elevation: 5,
                                child: Container(
                                  // padding: EdgeInsets.only(left: 7, right: 7),
                                  height: 80,

                                  decoration: BoxDecoration(
                                      color: isBeaforeMealClicked
                                          ? Colors.green
                                          : Colors.white,
                                      border: Border.all(
                                        color: isBeaforeMealClicked
                                            ? Colors.green
                                            : Colors.white,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Before Meal",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: isBeaforeMealClicked
                                            ? Colors.white
                                            : Color(0xff5A88BB),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                medicineConsume = "After Meal";
                                isBeaforeMealClicked = false;
                                isAfterMealClicked = true;
                                isWithMealClicked = false;
                                isNAClicked = false;
                                isButtonClicked = true;
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 145,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                elevation: 5,
                                child: Container(
                                  // padding: EdgeInsets.only(left: 7, right: 7),
                                  height: 80,

                                  decoration: BoxDecoration(
                                      color: isAfterMealClicked
                                          ? Colors.green
                                          : Colors.white,
                                      border: Border.all(
                                        color: isAfterMealClicked
                                            ? Colors.green
                                            : Colors.white,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "After Meal",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: isAfterMealClicked
                                            ? Colors.white
                                            : Color(0xff5A88BB),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                medicineConsume = "With Meal";
                                isBeaforeMealClicked = false;
                                isAfterMealClicked = false;
                                isWithMealClicked = true;
                                isNAClicked = false;
                                isButtonClicked = true;
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 145,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                elevation: 5,
                                child: Container(
                                  // padding: EdgeInsets.only(left: 7, right: 7),
                                  height: 80,

                                  decoration: BoxDecoration(
                                      color: isWithMealClicked
                                          ? Colors.green
                                          : Colors.white,
                                      border: Border.all(
                                        color: isWithMealClicked
                                            ? Colors.green
                                            : Colors.white,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "With Meal",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: isWithMealClicked
                                            ? Colors.white
                                            : Color(0xff5A88BB),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                medicineConsume = "N/A";
                                isBeaforeMealClicked = false;
                                isAfterMealClicked = false;
                                isWithMealClicked = false;
                                isNAClicked = true;
                                isButtonClicked = true;
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 145,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                elevation: 5,
                                child: Container(
                                  // padding: EdgeInsets.only(left: 7, right: 7),
                                  height: 80,

                                  decoration: BoxDecoration(
                                      color: isNAClicked
                                          ? Colors.green
                                          : Colors.white,
                                      border: Border.all(
                                        color: isNAClicked
                                            ? Colors.green
                                            : Colors.white,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "N/A",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: isNAClicked
                                            ? Colors.white
                                            : Color(0xff5A88BB),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    // padding: EdgeInsets.only(left: 19, right: 18),
                    height: 55,
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
                      onPressed: isButtonClicked
                          ? () {
                              widget.onNext();
                              var buttonPressedValue = medicineConsume;
                              Future.delayed(Duration(seconds: 2));
                              Navigator.pop(context, buttonPressedValue);
                            }
                          : null,
                      child: Text(
                        "Done",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
