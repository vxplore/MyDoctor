import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChiefComplaintsDetailsPage extends StatefulWidget {
  const ChiefComplaintsDetailsPage({super.key});

  @override
  State<ChiefComplaintsDetailsPage> createState() =>
      _ChiefComplaintsDetailsPageState();
}

class _ChiefComplaintsDetailsPageState
    extends State<ChiefComplaintsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3FBFF),
      appBar: AppBar(
        backgroundColor: Color(0xff1468B3),
        toolbarHeight: 70,
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
          size: 35,
        ),
        title: Text(
          "Nitish Complaints",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 14, top: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xffDFD0D0), // Border color
                  width: 0.5, // Border width
                ),
              ),
              height: 70,
              width: 390,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Smsm",
                      style: TextStyle(fontSize: 18, color: Color(0xffBBBBBB)),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      // method to show the search bar
                    },
                    icon: const Icon(Icons.close, color: Colors.red, size: 25),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 20, top: 30),
            child: Container(
              height: 80,
              width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Smsm",
                        style:
                            TextStyle(fontSize: 34, color: Color(0xff5A7AC5)),
                      ),
                      Text(
                        "Add as chief Complaint",
                        style:
                            TextStyle(fontSize: 18, color: Color(0xff5A7AC5)),
                      ),
                    ],
                  ),
                  Spacer(),
                  InkWell(onTap: (){},
                    child: Icon(
                      Icons.add_circle,
                      color: Color(0xff178A32),
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                    height: 150,
                    width: 150,
                    child: Image.asset(
                      "assets/images/teeth_icon.png",
                      fit: BoxFit.fill,
                    )),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    textAlign: TextAlign.center,
                    "No chief complaints found",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff555555),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 58, right: 76),
                    child: Column(
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          "For adding 'Smsm' as Chief Complaints ",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xffB7B7B7),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              "you can click on",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xffB7B7B7),
                              ),
                            ),
                            Icon(
                              Icons.add_circle,
                              color: Color(0xff178A32),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              "symbol",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xffB7B7B7),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
