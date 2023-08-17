import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/pages/congratulations_page.dart';
import 'package:pinput/pinput.dart';

import '../custom widget/button.dart';

class ProfessionalDetailsPage extends StatefulWidget {
  const ProfessionalDetailsPage({super.key});

  @override
  State<ProfessionalDetailsPage> createState() =>
      _ProfessionalDetailsPageState();
}

class _ProfessionalDetailsPageState extends State<ProfessionalDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF3FBFF),
        body: Padding(
          padding: const EdgeInsets.only(left: 29, right: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    height: 112,
                    width: 110,
                    child: Image.asset("assets/images/instadoclogo.png")),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Your Professional detail",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter your professional Details",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Color(0xffBBBBBB)),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 350,
                width: 500,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 500,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 25),
                                child: Image.asset(
                                    "assets/images/registration_icon.png")),
                            const SizedBox(width: 5),
                            Container(
                              height: 70,
                              width: 300,
                              child: const Padding(
                                padding: EdgeInsets.all(0),
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: 'Registration Number',
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
                        height: 20,
                      ),
                      Container(
                        height: 70,
                        width: 500,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 25),
                                child: Image.asset(
                                    "assets/images/medicalCouncil_icon.png")),
                            const SizedBox(width: 5),
                            Container(
                              height: 70,
                              width: 300,
                              child: const Padding(
                                padding: EdgeInsets.all(0),
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: 'State Medical Council',
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
                        height: 20,
                      ),
                      Container(
                        height: 70,
                        width: 500,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 25),
                                child: Image.asset(
                                    "assets/images/speciallity_icon.png")),
                            const SizedBox(width: 5),
                            Container(
                              height: 70,
                              width: 300,
                              child: const Padding(
                                padding: EdgeInsets.all(0),
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: 'Speciality',
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
                        height: 20,
                      ),
                      Container(
                        height: 70,
                        width: 500,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 25),
                                child: Image.asset(
                                    "assets/images/experience_icon.png")),
                            const SizedBox(width: 5),
                            Container(
                              height: 70,
                              width: 300,
                              child: const Padding(
                                padding: EdgeInsets.all(0),
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: 'Year of Experience',
                                    labelStyle: TextStyle(
                                        fontSize: 25, color: Color(0xffC7C7C7)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Your KYC",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffCFCFCF)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "(Aadhar Card)",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffCFCFCF)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 75,
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 75,
                      width: 165,
                      color: Colors.white,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Font",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(0xffCFCFCF)),
                        ),
                      ),
                    ),
                    Container( height: 75,
                      width: 165,
                      color: Colors.white,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Back",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(0xffCFCFCF)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    height: 70,
                    width: 500,
                    child: ourButton(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CongratulationsPage()),
                          );
                        },
                        color: Color(0xff1468B3),
                        title: "Next Step",
                        textColor: Colors.white)),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 4, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "I agree with all the",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffCFCFCF)),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "terms and conditions",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1468B3),
                          decoration: TextDecoration.underline),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "of eprescribe.in",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffCFCFCF),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
