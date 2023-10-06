import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/pages/myPatient_page.dart';
import 'package:my_doctor/service/global_variables.dart';
import 'package:my_doctor/service/navigation_service.dart';
import 'package:my_doctor/view_models/addPatientPersonalInfo_view_model.dart';
import 'inner page/allergies_page.dart';
import 'inner page/history_page.dart';
import 'inner page/patientpersonalinfo_page.dart';
import 'main_dashboard_page.dart';

class AddPatientPage extends StatefulWidget {
  const AddPatientPage({super.key});

  @override
  State<AddPatientPage> createState() => _AddPatientPageState();
}

class _AddPatientPageState extends State<AddPatientPage> {
  final vm = AddPatientPersonalInfoViewModel();

  TabBar get _tabBar => TabBar(
        indicatorColor: Color(0xff7C8DA1),
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: [
          Tab(
            height: 65,
            child: Text(
              "Personal Info",
              style: TextStyle(fontSize: 17, color: Color(0xff9D9D9D)),
            ),
          ),
          Tab(
            child: Text(
              "Allergies",
              style: TextStyle(fontSize: 17, color: Color(0xff9D9D9D)),
            ),
          ),
          Tab(
            child: Text(
              "History",
              style: TextStyle(fontSize: 17, color: Color(0xff9D9D9D)),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF3FBFF),
        appBar: AppBar(
          toolbarHeight: 85,
          leading: InkWell(
            onTap: () {
              print("before clear : ${globalVariables.patientGender}");
              setState(() {
                globalVariables.patientGender = "";
                globalVariables.profileImagePath = "";
                globalVariables.ageController.text = "";
                globalVariables.dropdownvalue = "Years";
              });
              print("After clear : ${globalVariables.patientGender}");
              Navigator.pop(context);
            },
            child: Icon(
              Icons.highlight_off,
              color: Colors.white,
              size: 45,
            ),
          ),
          title: Text(
            "Add Patient",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 13),
              child: InkWell(
                ///////Add personal info patient api call////////////////
                onTap: () async {
                  print("before clear : ${globalVariables.patientGender}");
                  vm.addPatientPersonalDetails(
                      globalVariables.profileImagePath,
                      globalVariables.ageController.text,
                      globalVariables.patientGender,
                      globalVariables.dropdownvalue,
                      context);

                  setState(() {
                    globalVariables.patientGender = "";
                    globalVariables.profileImagePath = "";
                    globalVariables.ageController.text = "";
                    globalVariables.dropdownvalue = "Years";
                  });
                  print("After clear : ${globalVariables.patientGender}");
                  NavigationService().navigateToScreen(MainDashboardPage());
                },
                child: Icon(
                  Icons.done_outline,
                  size: 50,
                  color: Colors.white,
                ),
              ),
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
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [PatientPersonalInfopage(), AllergiesPage(), HistoryPage()],
        ),
      ),
    );
  }
}
