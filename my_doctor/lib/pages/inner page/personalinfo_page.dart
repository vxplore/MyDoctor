import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/custom%20widget/button.dart';

class PersonalInfopage extends StatefulWidget {
  const PersonalInfopage({super.key});

  @override
  State<PersonalInfopage> createState() => _PersonalInfopageState();
}

class _PersonalInfopageState extends State<PersonalInfopage> {
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
                  width: 277,
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
                        width: 230,
                        child: const Padding(
                          padding: EdgeInsets.all(0),
                          child: TextField(
                            obscureText: true,
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
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Icon(
                    Icons.expand_more,
                    size: 40,
                    color: Color(0xff757575),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Select Date of Birth",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4273A4)),
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
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 45,
                  width: 120,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(12),
                          backgroundColor: Color(0xff4362AA)),
                      onPressed: () {},
                      child: Text(
                        "Male",
                        style: TextStyle(
                            color: Colors.white,
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
                          backgroundColor: Colors.white),
                      onPressed: () {},
                      child: Text(
                        "Female",
                        style: TextStyle(
                            color: Color(0xffAFAFAF),
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
                          backgroundColor: Colors.white),
                      onPressed: () {},
                      child: Text(
                        "Others",
                        style: TextStyle(
                            color: Color(0xffAFAFAF),
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "More",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4273A4)),
            ),
          ],
        ),
      ),
    );
  }
}
