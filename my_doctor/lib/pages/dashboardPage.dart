import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/custom%20widget/custom_circularProgress.dart';
import 'package:my_doctor/pages/doctor_profile_page.dart';
import 'package:my_doctor/pages/login_page.dart';
import 'package:my_doctor/pages/settings_page.dart';
import 'package:my_doctor/pages/support_page.dart';
import 'package:my_doctor/service/global_variables.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';
import '../core/di/di.dart';
import '../core/repository/preference_repo.dart';
import '../custom widget/logout_dialog.dart';
import '../service/navigation_service.dart';
import 'package:url_launcher/url_launcher.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
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
      backgroundColor: Color(0xffF3FBFF),
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
                color: Color(0xff1468B3),
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
                          InkWell(
                            onTap: () async {
                              Share.share(
                                  'hey! check out this new app https://play.google.com/store/search?q=pub%3ADivTag&c=apps',
                                  subject: 'DivTag Apps Link');
                              /* final String appLink = 'https://play.google.com/store/apps/details?id=com.example.myapp';
                            final String message = 'Check out my new app: $appLink';

                            // Share the app link and message using the share dialog
                            await FlutterShare.share(title: 'Share App', text: message, linkUrl: appLink);*/
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
                                // "AM",
                                // "${globalVariables.getDoctorDetails!.doctor.name[0]}",
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
                            // "Dr.\nArpan Manna",
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
                      InkWell(
                        onTap: () {
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
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SupportPage()),
                        );
                      },
                      child: Text(
                        "Support",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () async {
                        final Uri url = Uri(scheme: "tel", path: "18888888818");
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
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Settings",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.normal),
                  ),
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
                child: InkWell(
                  onTap: () {
                    final prefs = dependency<PreferenceRepo>();
                    print(prefs.userid());
                  },
                  child: Text(
                    "About",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.normal),
                  ),
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
              SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        Vibration.vibrate(duration: 1000);

                        String email = Uri.encodeComponent("myDoc@gmail.com");
                        /* String subject = Uri.encodeComponent("Hello Flutter");
                      String body = Uri.encodeComponent("Hi! I'm Flutter Developer");
                      print(subject); //output: Hello%20Flutter
                       Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");*/
                        Uri mail = Uri.parse("mailto:$email");
                        if (await launchUrl(mail)) {
                          //email app opened
                        } else {
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
      appBar: AppBar(
        backgroundColor: Color(0xff1468B3),
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 88,
        title: Image.asset(
          "assets/images/instadoclogo.png",
          scale: 2.5,
        ),
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Icon(
            Icons.menu,
            size: 45,
            color: Color(0xff41CFD9),
          ),
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
      body: globalVariables.getDoctorDetails == null
          ? MyCircularIndicator()
          : Padding(
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
                              // "Dr. Ajay Singh",
                              "Dr. ${globalVariables.getDoctorDetails!.doctor.name}",
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              // "assets/images/instadoclogo.png",
                              globalVariables
                                  .getDoctorDetails!.doctor.profileImage,
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width,
                            ),
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
                            child: Text(
                              textAlign: TextAlign.center,
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
