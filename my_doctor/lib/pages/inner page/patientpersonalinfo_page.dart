import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_doctor/custom%20widget/button.dart';
import 'package:my_doctor/pages/patient_prescription_page.dart';

import '../../service/global_variables.dart';

class PatientPersonalInfopage extends StatefulWidget {
  const PatientPersonalInfopage({super.key});

  @override
  State<PatientPersonalInfopage> createState() =>
      _PatientPersonalInfopageState();
}

class _PatientPersonalInfopageState extends State<PatientPersonalInfopage> {
  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  bool isOthersSelected = false;
  // String dropdownvalue = "Years";
  String? bloodGroupValue;
  DateTime? seletedYear;
  // var profileImagePath = '';
  // TextEditingController ageController = TextEditingController();

  // List of items in our dropdown menu
  var items = ['Years', 'Months', "Days"];
  var bloodgroups = [
    "A RhD positive (A+)",
    "A RhD negative (A-)",
    "B RhD positive (B+)",
    "B RhD negative (B-)",
    "O RhD positive (O+)",
    "O RhD negative (O-)",
    "AB RhD positive (AB+)",
    "AB RhD negative (AB-)"
  ];
  String? calculatedAgeinYears;
  String? calculatedAgeinMonths;
  String? calculatedAgeinDays;
  bool isMoreButtonClicked = false;

  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media, imageQuality: 50);
    if (img == null)
      // img = await ImagePicker().pickImage(source: ImageSource.gallery);
      return;
    setState(() {
      // globalVariables.image = img;
      globalVariables.profileImagePath = img.path;
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  /* initialValue(val) {
    return TextEditingController(text: val);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3FBFF),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 12),
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
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
                      child: globalVariables.profileImagePath == ""
                          ? Image.asset(
                              "assets/images/instadoclogo.png",
                              fit: BoxFit.fill,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.file(
                                File(globalVariables.profileImagePath),
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: 300,
                              ),
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
                      onPressed: () {
                        myAlert();
                      },
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
                            controller: globalVariables.ageController,
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
                    value: globalVariables.dropdownvalue,

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
                        globalVariables.dropdownvalue = newValue!;
                      });
                      print(globalVariables.dropdownvalue);
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

                setState(() {
                  calculatedAgeinYears =
                      (DateTime.now().year - seletedYear!.year).toString();
                  calculatedAgeinMonths =
                      (DateTime.now().month - seletedYear!.month).toString();
                  calculatedAgeinDays =
                      (DateTime.now().day - seletedYear!.day).toString();
                  print(seletedYear?.year);


                  if (calculatedAgeinYears != "0") {
                    globalVariables.dropdownvalue = "Years";
                  } else if (calculatedAgeinMonths != "0" &&
                      calculatedAgeinYears == "0") {
                    globalVariables.dropdownvalue = "Months";
                  } else if (calculatedAgeinDays != "0" &&
                      calculatedAgeinYears == "0" &&
                      calculatedAgeinMonths == "0") {
                    globalVariables.dropdownvalue = "Days";
                  }
                  calculateAge();
                });
                print(" Years : ${calculatedAgeinYears}");
                print(" Months : ${calculatedAgeinMonths}");
                print(" Days : ${calculatedAgeinDays}");
                print("Dropdownvalue: ${globalVariables.dropdownvalue}");
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
                setState(() {
                  isMoreButtonClicked = !isMoreButtonClicked;
                });

                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PatientPrescriptionPage()),
                );*/
              },
              child: Text(
                isMoreButtonClicked == true ? "Less" : "More",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff4273A4)),
              ),
            ),
            isMoreButtonClicked == true
                ? AnimatedContainer(
                    duration: Duration(seconds: 2),
                    child: Container(
                      height: 1160,
                      width: 1.sw,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Patient ID",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.normal,
                                color: Color(0xffC7C7C7)),
                          ),
                          Container(
                            height: 70,
                            width: 1.sw,
                            child: const Padding(
                              padding: EdgeInsets.all(0),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(),
                              ),
                            ),
                          ),
                          Divider(color: Colors.grey.shade300, thickness: 3),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Email Address",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.normal,
                                color: Color(0xffC7C7C7)),
                          ),
                          Container(
                            height: 70,
                            width: 1.sw,
                            child: const Padding(
                              padding: EdgeInsets.all(0),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(),
                              ),
                            ),
                          ),
                          Divider(color: Colors.grey.shade300, thickness: 3),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 80,
                            width: 1.sw,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Height",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xffC7C7C7)),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 70,
                                      child: const Padding(
                                        padding: EdgeInsets.all(0),
                                        child: TextField(
                                          obscureText: true,
                                          decoration: InputDecoration(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "cm(s)",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xffC7C7C7)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Weight",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xffC7C7C7)),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 70,
                                      child: const Padding(
                                        padding: EdgeInsets.all(0),
                                        child: TextField(
                                          obscureText: true,
                                          decoration: InputDecoration(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "kg(s)",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xffC7C7C7)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "BMI",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xffC7C7C7)),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 70,
                                      child: const Padding(
                                        padding: EdgeInsets.all(0),
                                        child: TextField(
                                          obscureText: true,
                                          decoration: InputDecoration(),
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
                          Text(
                            "Blood Group",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.normal,
                                color: Color(0xffC7C7C7)),
                          ),
                          Container(
                            height: 70,
                            width: 1.sw,
                            margin: EdgeInsets.only(top: 32),
                            child: DropdownButton(
                              hint: Text("Select Blood Group"),
                              iconSize: 40,
                              isExpanded: true,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                              // Initial Value
                              value: bloodGroupValue,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: bloodgroups.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                setState(() {
                                  bloodGroupValue = newValue!;
                                });
                                print(bloodGroupValue);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Divider(color: Colors.grey.shade300, thickness: 3),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Referred By",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.normal,
                                color: Color(0xffC7C7C7)),
                          ),
                          Container(
                            height: 70,
                            width: 1.sw,
                            child: const Padding(
                              padding: EdgeInsets.all(0),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(),
                              ),
                            ),
                          ),
                          Divider(color: Colors.grey.shade300, thickness: 3),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Address",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.normal,
                                color: Color(0xffC7C7C7)),
                          ),
                          Container(
                            height: 70,
                            width: 1.sw,
                            child: const Padding(
                              padding: EdgeInsets.all(0),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(),
                              ),
                            ),
                          ),
                          Divider(color: Colors.grey.shade300, thickness: 3),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 100,
                            width: 1.sw,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Pin Code",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xffC7C7C7)),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 150,
                                      child: const Padding(
                                        padding: EdgeInsets.all(0),
                                        child: TextField(
                                          obscureText: true,
                                          decoration: InputDecoration(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "City",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xffC7C7C7)),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 220,
                                      child: const Padding(
                                        padding: EdgeInsets.all(0),
                                        child: TextField(
                                          obscureText: true,
                                          decoration: InputDecoration(),
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
                          Text(
                            "Country",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.normal,
                                color: Color(0xffC7C7C7)),
                          ),
                          Container(
                            height: 70,
                            width: 1.sw,
                            child: const Padding(
                              padding: EdgeInsets.all(0),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(),
                              ),
                            ),
                          ),
                          Divider(color: Colors.grey.shade300, thickness: 3),
                        ],
                      ),
                    ),
                  )
                : Container(
                    height: 0,
                    width: 0,
                  ),
          ],
        ),
      ),
    );
  }

  calculateAge() {
    if (calculatedAgeinYears != "0") {
      globalVariables.ageController.text = calculatedAgeinYears.toString();
    } else if (calculatedAgeinMonths != "0" && calculatedAgeinYears == "0") {
      globalVariables.ageController.text = calculatedAgeinMonths.toString();
    } else if (calculatedAgeinDays != "0" &&
        calculatedAgeinYears == "0" &&
        calculatedAgeinMonths == "0") {
      globalVariables.ageController.text = calculatedAgeinDays.toString();
    }

    print("Textediting ::${globalVariables.ageController.text}");
  }
}
