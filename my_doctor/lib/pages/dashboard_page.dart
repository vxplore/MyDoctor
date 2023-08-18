import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      Padding(
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
      ///////////////end Dashboard//////////////////////

      ////////////// My Patient ///////////////////////
      Icon(
        Icons.camera,
        size: 150,
      ),
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