

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/custom%20widget/button.dart';
import 'package:my_doctor/pages/patient_prescription_page.dart';

import '../../service/global_variables.dart';

class PersonalInfopage extends StatefulWidget {
  const PersonalInfopage({super.key});

  @override
  State<PersonalInfopage> createState() => _PersonalInfopageState();
}

class _PersonalInfopageState extends State<PersonalInfopage> {
  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  bool isOthersSelected = false;
  String dropdownvalue = "Years";
  DateTime? seletedYear;
  TextEditingController ageController = TextEditingController();
  // List of items in our dropdown menu
  var items = ['Years', 'Months'];
  String? calculatedAge;

 /* initialValue(val) {
    return TextEditingController(text: val);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3FBFF),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Align(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey)),
                    child: CircleAvatar(
                      maxRadius: 70,
                      child: Image.asset(
                        "assets/images/instadoclogo.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        size: 23,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              width: 500,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Image.asset(
                        "assets/images/mobile_icon.png",
                        scale: 0.9,
                      )),
                  Container(
                    height: 70,
                    width: 342,
                    child: const Padding(
                      padding: EdgeInsets.all(0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Mobile Number*',
                          labelStyle:
                              TextStyle(fontSize: 25, color: Color(0xffC7C7C7)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              width: 500,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Image.asset(
                        "assets/images/mobile_icon.png",
                        scale: 0.9,
                      )),
                  Spacer(),
                  Container(
                    height: 70,
                    width: 342,
                    child: const Padding(
                      padding: EdgeInsets.all(0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Full Name*',
                          labelStyle:
                              TextStyle(fontSize: 25, color: Color(0xffC7C7C7)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  height: 70,
                  width: 257,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Image.asset(
                            "assets/images/mobile_icon.png",
                            scale: 0.9,
                          )),
                      Container(
                        height: 70,
                        width: 210,
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: TextField(
                            controller:  ageController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Age*',
                              labelStyle: TextStyle(
                                  fontSize: 25, color: Color(0xffC7C7C7)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 110,
                  margin: EdgeInsets.only(top: 32),
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

                /* Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Years",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff474747)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Icon(
                    Icons.expand_more,
                    size: 40,
                    color: Color(0xff757575),
                  ),
                ),*/
              ],
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {

                seletedYear = await showDatePicker(
                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                     context: (context));
                int calculatedAge = DateTime.now().year - seletedYear!.year;
                print(seletedYear?.year);
                print(calculatedAge);
calculateAge();
              },
              child: Text(
                "Select Date of Birth",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff4273A4)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Gender*",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  color: Color(0xffC7C7C7)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 45,
                  width: 120,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          backgroundColor: isMaleSelected == true
                              ? Color(0xff4362AA)
                              : Colors.white),
                      onPressed: () {
                        setState(() {
                          globalVariables.patientGender = "Male";
                          isMaleSelected = true;
                          isFemaleSelected = false;
                          isOthersSelected = false;
                        });
                      },
                      child: Text(
                        "Male",
                        style: TextStyle(
                            color: isMaleSelected == true
                                ? Colors.white
                                : Color(0xffAFAFAF),
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      )),
                ),
                Container(
                  height: 45,
                  width: 120,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          backgroundColor: isFemaleSelected == true
                              ? Color(0xff4362AA)
                              : Colors.white),
                      onPressed: () {
                        setState(() {
                          globalVariables.patientGender = "Female";
                          isMaleSelected = false;
                          isFemaleSelected = true;
                          isOthersSelected = false;
                        });
                      },
                      child: Text(
                        "Female",
                        style: TextStyle(
                            color: isFemaleSelected == true
                                ? Colors.white
                                : Color(0xffAFAFAF),
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      )),
                ),
                Container(
                  height: 45,
                  width: 120,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(12),
                          backgroundColor: isOthersSelected == true
                              ? Color(0xff4362AA)
                              : Colors.white),
                      onPressed: () {
                        setState(() {
                          globalVariables.patientGender = "Others";
                          isMaleSelected = false;
                          isFemaleSelected = false;
                          isOthersSelected = true;
                        });
                      },
                      child: Text(
                        "Others",
                        style: TextStyle(
                            color: isOthersSelected == true
                                ? Colors.white
                                : Color(0xffAFAFAF),
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PatientPrescriptionPage()),
                );
              },
              child: Text(
                "More",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff4273A4)),
              ),
            ),
          ],
        ),
      ),
    );
  }
  calculateAge() {
    setState(() {
      ageController.text= calculatedAge.toString();
      print("Textediting ::${ageController.text}");
    });

  }
}
