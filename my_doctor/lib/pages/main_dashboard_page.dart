import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/custom%20widget/custom_circularProgress.dart';
import 'package:my_doctor/pages/video_consult_page.dart';

import '../service/commonDataSource.dart';
import '../service/global_variables.dart';
import 'appointment_page.dart';
import 'billing_page.dart';
import 'dashboardPage.dart';
import 'myPatient_page.dart';

class MainDashboardPage extends StatefulWidget {
  const MainDashboardPage({super.key});

  @override
  State<MainDashboardPage> createState() => _MainDashboardPageState();
}

class _MainDashboardPageState extends State<MainDashboardPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) async {
      if (timer.tick == 1) {
        timer.cancel();
        await CommonDataSource().getDoctorDetails();
        Future.delayed(Duration(seconds: 2));
        setState(() {
          globalVariables.getDoctorDetails =
              globalVariables.getDoctorDetailsFromApi;
        });
      }
    });
  }

  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      globalVariables.getDoctorDetails == null
          ? MyCircularIndicator()
          : DashBoardPage(),
      globalVariables.getDoctorDetails == null
          ? MyCircularIndicator(): MyPatientPage(),
      globalVariables.getDoctorDetails == null
          ? MyCircularIndicator(): AppointmentTab(),
      globalVariables.getDoctorDetails == null
          ? MyCircularIndicator(): VideoConsultTab(),
      globalVariables.getDoctorDetails == null
          ? MyCircularIndicator(): BillingTabPage()
      /*Icon(
        Icons.chat,
        size: 150,
      ),*/
    ];
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      /*Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),*/
      // pages[pageIndex],
      bottomNavigationBar:
          // buildMyNavBar(context),
          BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        selectedIconTheme: IconThemeData(color: Color(0xff98CCFD), size: 30),
        selectedItemColor: Color(0xff98CCFD),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_add_alt_1,
            ),
            label: 'My Patient',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
            ),
            label: 'Appointment',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.ondemand_video,
            ),
            label: 'Video Consult',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.receipt,
            ),
            label: 'Billing',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
