import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartMedicationDialog extends StatefulWidget {
  const StartMedicationDialog({super.key});

  @override
  State<StartMedicationDialog> createState() => _StartMedicationDialogState();
}

class _StartMedicationDialogState extends State<StartMedicationDialog> {
  bool isTodayClicked = false;
  bool isTomorrowClicked = false;
  bool isOthersClicked = false;
  bool isNAClicked = false;
  bool isButtonClicked = false;
  String startmedicine = "";
  String? dropdownvalue;

  // List of items in our dropdown menu
  var items = [
    'English',
    'Bengali',
    'Hindi',
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          height: 370,
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
                    "Start Medication From?",
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
                  height: 225,
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
                                startmedicine = "Today";
                                isTodayClicked = true;
                                isTomorrowClicked = false;
                                isOthersClicked = false;
                                // isNAClicked = false;
                                isButtonClicked = true;
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 95,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                elevation: 5,
                                child: Container(
                                  // padding: EdgeInsets.only(left: 7, right: 7),
                                  height: 80,

                                  decoration: BoxDecoration(
                                      color: isTodayClicked
                                          ? Colors.green
                                          : Colors.white,
                                      border: Border.all(
                                        color: isTodayClicked
                                            ? Colors.green
                                            : Colors.white,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Today",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: isTodayClicked
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
                                startmedicine = "Tomorrow";
                                isTodayClicked = false;
                                isTomorrowClicked = true;
                                isOthersClicked = false;
                                // isNAClicked = false;
                                isButtonClicked = true;
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 95,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                elevation: 5,
                                child: Container(
                                  // padding: EdgeInsets.only(left: 7, right: 7),
                                  height: 80,

                                  decoration: BoxDecoration(
                                      color: isTomorrowClicked
                                          ? Colors.green
                                          : Colors.white,
                                      border: Border.all(
                                        color: isTomorrowClicked
                                            ? Colors.green
                                            : Colors.white,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Tomorrow",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: isTomorrowClicked
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
                                startmedicine = "Others";
                                isTodayClicked = false;
                                isTomorrowClicked = false;
                                isOthersClicked = true;
                                // isNAClicked = false;
                                isButtonClicked = true;
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 95,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                elevation: 5,
                                child: Container(
                                  // padding: EdgeInsets.only(left: 7, right: 7),
                                  height: 80,

                                  decoration: BoxDecoration(
                                      color: isOthersClicked
                                          ? Colors.green
                                          : Colors.white,
                                      border: Border.all(
                                        color: isOthersClicked
                                            ? Colors.green
                                            : Colors.white,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Others",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: isOthersClicked
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
                      SizedBox(
                        height: 10,
                      ),
                      /* Text(
                        "Remark(s)",
                        style: TextStyle(color: Color(0xff5A88BB), fontSize: 14),
                      ),*/
                      Container(
                        height: 70,
                        width: 300,
                        child: const Padding(
                          padding: EdgeInsets.all(0),
                          child: TextField(
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Remark(s)',
                              labelStyle: TextStyle(
                                  fontSize: 15, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Language",
                        style:
                            TextStyle(color: Color(0xff5A88BB), fontSize: 14),
                      ),
                      Container(
                        height: 50,
                        width: 500,
                        child: DropdownButton(
                          iconSize: 40,
                          isExpanded: true,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          // Initial Value
                          value: dropdownvalue,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                            print(dropdownvalue);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
               Spacer(),
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
                      onPressed: isButtonClicked
                          ? () {
                              var buttonPressedValue = startmedicine;
                              var selectedLanguageValue = dropdownvalue;
                              Map<String, String> myData = new Map();
                              myData['buttonPressedValue'] = buttonPressedValue;
                              myData['selectedLanguageValue'] = selectedLanguageValue!;
                              Future.delayed(Duration(seconds: 2));
                              Navigator.pop(context,myData);
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
      ),
    );
  }
}
