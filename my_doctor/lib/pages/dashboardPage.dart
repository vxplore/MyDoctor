import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3FBFF),
      appBar: AppBar(
        backgroundColor: Color(0xff1468B3),
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 88,
        title: Image.asset(
          "assets/images/instadoclogo.png",
          scale: 2.5,
        ),
        leading: Icon(
          Icons.menu,
          size: 45,
          color: Color(0xff41CFD9),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              size: 45,
              color: Color(0xff41CFD9),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 19, right: 21),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              height: 100,
              width: 500,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Color(0xffB1B1B1)),
                      ),
                      Text(
                        "Dr. Ajay Singh",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    maxRadius: 35,
                    child: Image.asset(
                      "assets/images/instadoclogo.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Image.asset(
                    "assets/images/dashboard_icon.png",
                    scale: 0.6,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.only(left: 67, right: 59),
                      child: Text(textAlign: TextAlign.center,
                        "Your document is under verifications. We will put your profile live once our backend team will complete the process.",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff989898)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
