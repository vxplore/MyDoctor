import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboardPage.dart';
import 'myPatient_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  int _selectedIndex = 0;

  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      ///////////////DashBoard///////////////////
      DashBoardPage(),
      ///////////////end Dashboard//////////////////////

      ////////////// My Patient ///////////////////////
      /*Icon(
        Icons.camera,
        size: 150,
      ),*/
      MyPatientPage(),
      ////////////// end My Patient ///////////////////
      Icon(
        Icons.chat,
        size: 150,
      ),
      Icon(
        Icons.chat,
        size: 150,
      ),
      Icon(
        Icons.chat,
        size: 150,
      ),
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
        selectedFontSize: 15,
        selectedIconTheme: IconThemeData(color: Color(0xff98CCFD), size: 40),
        selectedItemColor: Color(0xff98CCFD),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard,),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt_1,),
            label: 'My Patient',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today,),
            label: 'Appointment',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.ondemand_video,),
            label: 'Video Consult',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt,),
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