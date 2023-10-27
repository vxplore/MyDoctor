import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/pages/doctor_profile_page.dart';
import 'package:my_doctor/pages/inner%20page/doctor_practice_page.dart';
import 'package:my_doctor/service/navigation_service.dart';

import 'inner page/allergies_page.dart';
import 'inner page/doctor_professional_edit_page.dart';
import 'inner page/doctorpersonalinfo_page.dart';
import 'inner page/history_page.dart';
import 'inner page/patientpersonalinfo_page.dart';

class DoctorProfileEditPage extends StatefulWidget {
  final int initialTabIndex;
  const DoctorProfileEditPage({super.key, required this.initialTabIndex});

  @override
  State<DoctorProfileEditPage> createState() => _DoctorProfileEditPageState();
}

class _DoctorProfileEditPageState extends State<DoctorProfileEditPage> {
  TabBar get _tabBar => TabBar(
    indicatorColor: Color(0xff7C8DA1),
    unselectedLabelColor: Colors.grey,
    indicatorSize: TabBarIndicatorSize.tab,
    tabs: [
      Tab(
        height: 65,
        child: Text(
          "PERSONAL",
          style: TextStyle(fontSize: 14, color: Color(0xff9D9D9D)),
        ),
      ),
      Tab(
        child: Text(
          "PROFESSIONAL",
          style: TextStyle(fontSize: 14, color: Color(0xff9D9D9D)),
        ),
      ),
      Tab(
        child: Text(
          "PRACTICE",
          style: TextStyle(fontSize: 14, color: Color(0xff9D9D9D)),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.initialTabIndex,
      length: 3,
      child: WillPopScope(
        onWillPop: () async {
          NavigationService().navigateToScreen(DoctorProfilePage());
          return false;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xffF3FBFF),
          appBar: AppBar(
            toolbarHeight: 85,
            leading: InkWell(
              onTap: () {

                NavigationService().navigateToScreen(DoctorProfilePage());
              },
              child: Icon(
                Icons.highlight_off,
                color: Colors.white,
                size: 45,
              ),
            ),
            title: Text(
              "Edit Profile",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 13),
                child: InkWell(
                    onTap: () {

                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.done_outline,
                      size: 50,
                      color: Colors.white,
                    )),
              ),
            ],
            backgroundColor: Color(0xff1468B3),
            bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: ColoredBox(
                color: Colors.white,
                child: _tabBar,
              ),
            ),
          ),
          body: TabBarView(physics: NeverScrollableScrollPhysics(),
            children: [DoctorPersonalInfopage(), DoctorProfessionalEditPage(), DoctorPracticePage()],
          ),
        ),
      ),
    );
  }
}

