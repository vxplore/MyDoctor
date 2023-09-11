import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class VideoConsultTab extends StatefulWidget {
  const VideoConsultTab({super.key});

  @override
  State<VideoConsultTab> createState() => _VideoConsultTabState();
}

class _VideoConsultTabState extends State<VideoConsultTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple,
        body: SingleChildScrollView(
          // padding: EdgeInsets.only(left: 28,right: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: 1.sw,
                color: Colors.purple,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 80,
                      width: 1.sw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 50,
                          ),
                          Spacer(),
                          Icon(
                            Icons.share,
                            color: Colors.white,
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 120,
                      width: 1.sw,
                      // color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "AM",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 120,
                            width: 250,
                            /* decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                borderRadius:
                                BorderRadius.all(Radius.circular(20))),*/
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Good morning",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Dr.Arpan\nManna",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 530,
                width: 1.sw,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      height: 75,
                      width: 1.sw,
                      child: Row(
                        children: [
                          Text(
                            "No consultation yet",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.all(8),
                            height: 75,
                            width: 70,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.purple,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text("${DateTime.now().day}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.purple,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                  Text(
                                      "${DateFormat.MMM().format(DateTime.now())}",
                                      style: TextStyle(
                                          color: Colors.purple, fontSize: 18))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Lottie.asset(
                            "assets/animations/animation_lmeut8vu.json",
                            width: 250),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        textAlign: TextAlign.center,
                        "It's a good day to start\nVideo Consulting",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        textAlign: TextAlign.center,
                        "You are just 1 step away from starting\nwith Video Consultation",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 55,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 2,
                            color: Colors.purple,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.center,
                          "Get started",
                          style: TextStyle(
                              color: Colors.purple,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
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
    );
  }
}
