import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_doctor/pages/doctor_bank_details_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';
import '../custom widget/logout_dialog.dart';
import '../service/global_variables.dart';
import 'doctor_profile_page.dart';
import 'inner page/all_bill_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../service/navigation_service.dart';
import 'login_page.dart';

class BillingTabPage extends StatefulWidget {
  const BillingTabPage({super.key});

  @override
  State<BillingTabPage> createState() => _BillingTabPageState();
}

class _BillingTabPageState extends State<BillingTabPage> {
  TabBar get _tabBar => TabBar(
        indicatorPadding: EdgeInsets.all(8),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.green),
        isScrollable: true,
        indicatorColor: Color(0xff7C8DA1),
        physics: ScrollPhysics(),
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: [
          Tab(
            height: 65,
            child: Container(
              // padding: EdgeInsets.all(8),

              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "All",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ),
          Tab(
            height: 65,
            child: Container(
              // padding: EdgeInsets.all(8),
              width: 105,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Transferred",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ),
          Tab(
            height: 65,
            child: Container(
              // padding: EdgeInsets.all(8),
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Unpaid",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ),
          Tab(
            height: 65,
            child: Container(
              // padding: EdgeInsets.all(8),
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Prescrip Pay Link",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ),
          Tab(
            height: 65,
            child: Container(
              // padding: EdgeInsets.all(8),
              width: 175,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Video Consultation",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ),
          Tab(
            height: 65,
            child: Container(
              // padding: EdgeInsets.all(8),
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Refunds",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ),
          Tab(
            height: 65,
            child: Container(
              // padding: EdgeInsets.all(8),
              width: 145,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Offline Receipts",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ),
        ],
      );
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime? seletedYear;
  int? yearss;
  String? monthss;
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
    return DefaultTabController(
      length: 7,
      child: Scaffold(
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
                            InkWell(
                              onTap: () {
                                Share.share(
                                    'hey! check out this new app https://play.google.com/store/search?q=pub%3ADivTag&c=apps',
                                    subject: 'DivTag Apps Link');
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
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF3FBFF),
        appBar: AppBar(
          toolbarHeight: 85,
          leading: InkWell(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: Icon(
              Icons.menu,
              color: Colors.white,
              size: 45,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () async {
                  seletedYear = await showDatePicker(
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      context: (context));
                  setState(() {
                    monthss = DateFormat.MMM().format(seletedYear!);
                    yearss = seletedYear!.year;
                  });
                },
                child: Row(
                  children: [
                    Text(
                      (yearss == null && monthss == null)
                          ? "${DateFormat.MMM().format(DateTime.now())},${DateTime.now().year}"
                          : "${monthss},${yearss}",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 25,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Text(
                "Billed:₹ 0.00 | Received:₹ 0.00",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 13),
              child: InkWell(
                  onTap: () {
                    // Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.search,
                    size: 50,
                    color: Colors.white,
                  )),
            ),
            InkWell(
                onTap: () {
                  // Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Container(
                            height: 400,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 65,
                                ),
                                Container(
                                  height: 90,
                                  width: 150,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 150,
                                          child: Card(
                                            color: Colors.white,
                                            elevation: 0,
                                            child: InkWell(
                                              onTap: () {
                                                NavigationService()
                                                    .navigateToScreen(
                                                        DoctorBankDetailsPage());
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Payment",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 150,
                                          child: Card(
                                            color: Colors.white,
                                            elevation: 0,
                                            child: InkWell(
                                              onTap: () async {
                                                final Uri url = Uri(
                                                    scheme: "tel",
                                                    path: "18888888818");
                                                if (await canLaunchUrl(url)) {
                                                  await launchUrl(url);
                                                } else {
                                                  print("cannot start calling");
                                                }
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Support",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Icon(
                  Icons.more_vert,
                  size: 50,
                  color: Colors.white,
                )),
          ],
          backgroundColor: Color(0xff1468B3),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: Colors.grey.shade400,
              child: _tabBar,
            ),
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            AllBillPage(),
            AllBillPage(),
            AllBillPage(),
            AllBillPage(),
            AllBillPage(),
            AllBillPage(),
            AllBillPage()
          ],
        ),
      ),
    );
  }
}
