import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/pages/main_dashboard_page.dart';

import '../custom widget/button.dart';
import '../service/global_variables.dart';

class CongratulationsPage extends StatefulWidget {
  const CongratulationsPage({super.key});

  @override
  State<CongratulationsPage> createState() => _CongratulationsPageState();
}

class _CongratulationsPageState extends State<CongratulationsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF3FBFF),
        body: Padding(
          padding: EdgeInsets.only(left: 17, right: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 35,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    height: 175,
                    width: 175,
                    child: Image.asset(
                      "assets/images/done_icon.png",
                      color: Color(0xff188A33),
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Congratulations!",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff1468B3)),
              ),
              Text(
                // "Dr. Nitish Kumar",
                "Dr. ${globalVariables.docname}",
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                "Your Digital Clinic is ready!",
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.normal,
                    color: Color(0xffB4B4B4)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Active",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff959595)),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 70,
                width: 500,
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 45,
                        width: 45,
                        margin: const EdgeInsets.only(top: 12, left: 10),
                        child: Image.asset(
                          "assets/images/ePrescreption_icon.png",
                          fit: BoxFit.fill,
                          scale: 0.5,
                        )),
                    const SizedBox(width: 5),
                    Container(
                      height: 70,
                      width: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "ePriscriptions",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                          Text(
                            "Easy to create, easy to share!",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff959595)),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.check_circle,
                        color: Color(0xff3EB856),
                        size: 55,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Coming Soon",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff959595)),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 70,
                width: 500,
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 45,
                        width: 45,
                        margin: const EdgeInsets.only(top: 12, left: 10),
                        child: Image.asset(
                          "assets/images/ePrescreption_icon.png",
                          fit: BoxFit.fill,
                          scale: 0.5,
                        )),
                    const SizedBox(width: 5),
                    Container(
                      height: 70,
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Video Consulting",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                          Text(
                            "Reach to beyond your physical limit.",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff959595)),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.check_circle,
                        color: Color(0xffEBEBEB),
                        size: 55,
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
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 45,
                        width: 45,
                        margin: const EdgeInsets.only(top: 12, left: 10),
                        child: Image.asset(
                          "assets/images/ePrescreption_icon.png",
                          fit: BoxFit.fill,
                          scale: 0.5,
                        )),
                    const SizedBox(width: 5),
                    Container(
                      height: 70,
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Online Appointments",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                          Text(
                            "Empower your clinic with online Appointments",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff959595)),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.check_circle,
                        color: Color(0xffEBEBEB),
                        size: 55,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Container(
                    margin: EdgeInsets.only(bottom: 30),
                    height: 70,
                    width: 500,
                    child: ourButton(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainDashboardPage()),
                          );
                        },
                        color: Color(0xff1468B3),
                        title: "Go to Dashboard",
                        textColor: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
