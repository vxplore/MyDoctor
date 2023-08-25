import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../service/global_variables.dart';

class MedicationConsumeDialog extends StatefulWidget {
  const MedicationConsumeDialog({super.key});


  @override
  State<MedicationConsumeDialog> createState() =>
      _MedicationConsumeDialogState();
}

class _MedicationConsumeDialogState extends State<MedicationConsumeDialog>   {


  bool isBeaforeMealClicked = false;
  bool isAfterMealClicked = false;
  bool isWithMealClicked = false;
  bool isNAClicked = false;
  bool isButtonClicked = false;
  String medicineConsume = "";

  @override
  Widget build(BuildContext context) {
    return
      Dialog(
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
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
                            var buttonPressedValue = medicineConsume;
                            // Future.delayed(Duration(seconds: 2));

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
  }


}
