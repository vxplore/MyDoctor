import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/custom%20widget/button.dart';
import 'package:my_doctor/pages/otp_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xffF3FBFF),
          body: Padding(
            padding: EdgeInsets.only(left: 0.060.sw, right: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Let's create account",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                const Text(
                  "Welcome Doctor, Lets Create your account!",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffBBBBBB)),
                ),
                const SizedBox(
                  height: 8,
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
                          maxRadius: 80,
                          child: Image.asset(
                            "assets/images/instadoclogo.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.edit)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 430,
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
                                margin: EdgeInsets.only(top: 12),
                                child: const Text(
                                  "Dr.",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff707070)),
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: 70,
                                width: 300,
                                child: const Padding(
                                  padding: EdgeInsets.all(0),
                                  child: TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: 'Full Name',
                                      labelStyle: TextStyle(
                                          fontSize: 25, color: Color(0xffC7C7C7)),
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
                                  margin: const EdgeInsets.only(top: 15),
                                  child:
                                  Image.asset("assets/images/mobile_icon.png")),
                              Spacer(),
                              Container(
                                height: 70,
                                width: 300,
                                child: const Padding(
                                  padding: EdgeInsets.all(0),
                                  child: TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: 'Mobile Number',
                                      labelStyle: TextStyle(
                                          fontSize: 25, color: Color(0xffC7C7C7)),
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
                                  margin: const EdgeInsets.only(top: 23),
                                  child:
                                  Image.asset("assets/images/regEmail_icon.png")),
                              Spacer(),
                              Container(
                                height: 70,
                                width: 300,
                                child: const Padding(
                                  padding: EdgeInsets.all(0),
                                  child: TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: 'Email Address',
                                      labelStyle: TextStyle(
                                          fontSize: 25, color: Color(0xffC7C7C7)),
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
                                  margin: const EdgeInsets.only(top: 15),
                                  child:
                                  Image.asset("assets/images/regPassword_icon.png")),
                              Spacer(),
                              Container(
                                height: 70,
                                width: 300,
                                child: const Padding(
                                  padding: EdgeInsets.all(0),
                                  child: TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.remove_red_eye,
                                        color: Color(0xffC7C7C7),
                                        size: 40,
                                      ),
                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                          fontSize: 25, color: Color(0xffC7C7C7)),
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
                                  margin: const EdgeInsets.only(top: 15),
                                  child:
                                  Image.asset("assets/images/regPassword_icon.png")),
                              Spacer(),
                              Container(
                                height: 70,
                                width: 300,
                                child: const Padding(
                                  padding: EdgeInsets.all(0),
                                  child: TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.remove_red_eye,
                                        color: Color(0xffC7C7C7),
                                        size: 40,
                                      ),
                                      labelText: 'Re-enter Password',
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
                  height: 9,
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
                              MaterialPageRoute(builder: (context) => OtpPage()),
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
        ));
  }
}