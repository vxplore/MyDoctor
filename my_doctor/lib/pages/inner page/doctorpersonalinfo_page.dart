import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/custom%20widget/button.dart';
import 'package:my_doctor/pages/patient_prescription_page.dart';

import '../../service/global_variables.dart';

class DoctorPersonalInfopage extends StatefulWidget {
  const DoctorPersonalInfopage({super.key});

  @override
  State<DoctorPersonalInfopage> createState() => _DoctorPersonalInfopageState();
}

class _DoctorPersonalInfopageState extends State<DoctorPersonalInfopage> {
  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  bool isOthersSelected = false;

  DateTime? seletedYear;
  TextEditingController ageController = TextEditingController();
  String? calculatedAgeinYears;

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
                            controller: ageController,
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
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Years",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff474747)),
                  ),
                ),
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
                  print(seletedYear?.year);
                  print(" Years : ${calculatedAgeinYears}");
                  calculateAge();
                });
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
                          labelText: 'City*',
                          labelStyle:
                              TextStyle(fontSize: 25, color: Color(0xffC7C7C7)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
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
                          labelText: 'Email Address*',
                          labelStyle:
                              TextStyle(fontSize: 25, color: Color(0xffC7C7C7)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            /////////////////////////////////////////////
          ],
        ),
      ),
    );
  }

  calculateAge() {
    ageController.text = calculatedAgeinYears.toString();
    print("Textediting ::${ageController.text}");
  }
}
