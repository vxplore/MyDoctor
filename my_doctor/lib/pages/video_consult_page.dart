import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';
import '../custom widget/logout_dialog.dart';
import '../service/global_variables.dart';
import '../service/navigation_service.dart';
import 'doctor_profile_page.dart';
import 'login_page.dart';

class VideoConsultTab extends StatefulWidget {
  const VideoConsultTab({super.key});

  @override
  State<VideoConsultTab> createState() => _VideoConsultTabState();
}

class _VideoConsultTabState extends State<VideoConsultTab> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String firstInitial = "";
  String middleInitial = "";
  String lastInitial = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameCutter();
  }

  void nameCutter() {
    List<String> nameParts = globalVariables.getDoctorDetails!.doctor.name
        .split(' '); // Split the full name into parts

    if (nameParts.length == 2) {
      firstInitial = nameParts[0][0];
      lastInitial = nameParts[1][0];

      print("First Name Initial: $firstInitial");
      print("Last Name Initial: $lastInitial");
    } else if (nameParts.length == 3) {
      firstInitial = nameParts[0][0];
      middleInitial = nameParts[1][0];
      lastInitial = nameParts[2][0];
      // print("Invalid full name format");
      print("First Name Initial: $firstInitial");
      print("2nd Name Initial: $middleInitial");
      print("Last Name Initial: $lastInitial");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SafeArea(
        child: Drawer(
          width: 320,
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 250,
                width: 300,
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(onTap: (){
                            Share.share('hey! check out this new app https://play.google.com/store/search?q=pub%3ADivTag&c=apps', subject: 'DivTag Apps Link');
                          },
                            child: Icon(
                              Icons.share,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "${firstInitial}${middleInitial}${lastInitial}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Dr.\n${globalVariables.getDoctorDetails!.doctor.name}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(onTap: (){
                        NavigationService()
                            .navigateToScreen(DoctorProfilePage());
                      },
                        child: Row(
                          children: [
                            Text(
                              "VIEW & EDIT PROFILE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Support",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.normal),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () async {
                        final Uri url =
                        Uri(scheme: "tel", path: "18888888818");
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          print("cannot start calling");
                        }
                      },
                      child: Image.asset(
                        "assets/images/phone.png",
                        height: 40,
                        width: 40,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        final Uri whatsapp =
                        Uri.parse("https://wa.me/18888888818");
                        launchUrl(whatsapp);
                      },
                      child: Image.asset(
                        "assets/images/whatsapp.png",
                        height: 50,
                        width: 45,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Settings",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "CME",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "About",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: InkWell(
                  onTap: () async {
                    showDialog(
                        context: context,
                        builder: (context) => LogoutDialog(),
                        barrierDismissible: false);
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              SizedBox(height: 200,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(onTap: () async {
                      Vibration.vibrate(duration: 1000);

                      String email = Uri.encodeComponent("mail@fluttercampus.com");
                     /* String subject = Uri.encodeComponent("Hello Flutter");
                      String body = Uri.encodeComponent("Hi! I'm Flutter Developer");
                      print(subject); //output: Hello%20Flutter
                       Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");*/
                      Uri mail = Uri.parse("mailto:$email");
                      if (await launchUrl(mail)) {
                      //email app opened
                      }else{
                      //email app is not opened
                      }
                    },
                      child: Text(
                        "feedback",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Version:1.00",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 0,

      ),
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
                        InkWell(
                          onTap: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 50,
                          ),
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
                              "${firstInitial}${middleInitial}${lastInitial}",
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
                                "Dr.\n${globalVariables.getDoctorDetails!.doctor.name}",
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
    );
  }
}
