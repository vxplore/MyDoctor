import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  /* int pageIndex = 0;

  final pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];*/
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
      Icon(
        Icons.camera,
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
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
      // pages[pageIndex],
      bottomNavigationBar:
          // buildMyNavBar(context),
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 15,
            selectedIconTheme: IconThemeData(color: Colors.cyan, size: 40),
            selectedItemColor: Colors.cyan,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon( Icons.dashboard, ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.person_add_alt_1, ),
            label: 'My Patient',
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.calendar_today, ),
            label: 'Appointment',
          ),

          BottomNavigationBarItem(
            icon: Icon( Icons.ondemand_video, ),
            label: 'Video Consult',
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.receipt, ),
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
/*buildMyNavBar(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: Colors.red

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 65,
            width: 50,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  icon: pageIndex == 0
                      ? const Icon( Icons.dashboard,
                    color: Colors.cyan,
                    size: 35,
                  )
                      : const Icon( Icons.dashboard,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                Text("Dashboard")
              ],
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
              Icons.work_rounded,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.work_outline_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
              Icons.widgets_rounded,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.widgets_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? const Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.person_outline,
              color: Colors.white,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }*/
}

/*class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 1",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 2",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 4",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}*/
