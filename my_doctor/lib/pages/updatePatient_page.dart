import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/pages/inner%20page/habit_page.dart';
import 'package:my_doctor/pages/myPatient_page.dart';
import 'package:my_doctor/pages/patient_prescription_page.dart';
import 'package:my_doctor/service/global_variables.dart';
import 'package:my_doctor/service/navigation_service.dart';
import 'package:my_doctor/view_models/addPatientPersonalInfo_view_model.dart';
import 'package:my_doctor/view_models/update_patient_view_model.dart';
import 'inner page/allergies_page.dart';
import 'inner page/history_page.dart';
import 'inner page/patientpersonalinfo_page.dart';
import 'main_dashboard_page.dart';

class UpdatePatientPage extends StatefulWidget {

  const UpdatePatientPage({super.key});

  @override
  State<UpdatePatientPage> createState() => _UpdatePatientPageState();
}

class _UpdatePatientPageState extends State<UpdatePatientPage> {
  final vm = UpdatePatientViewModel();

  TabBar get _tabBar => TabBar(
    indicatorColor: Color(0xff7C8DA1),
    unselectedLabelColor: Colors.grey,
    indicatorSize: TabBarIndicatorSize.tab,
    tabs: [
      Tab(
        height: 65,
        child: Text(
          "Personal Info",
          textAlign: TextAlign.center,
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
      Tab(
        child: Text(
          "Habit",
          style: TextStyle(fontSize: 17, color: Color(0xff9D9D9D)),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF3FBFF),
        appBar: AppBar(
          toolbarHeight: 85,
          leading: InkWell(
            onTap: () {
              print("before clear : ${globalVariables.patientGender}");
              setState(() {
                globalVariables.patientsGender = null;
                globalVariables.patientAgeType = "";
                globalVariables.patientGender = "";
                globalVariables.profileImagePath = "";
                globalVariables.ageController.text = "";
                globalVariables.dropdownvalue = "Years";
                globalVariables.selectedDisease = [];
                globalVariables.selectedAllergy = [];
                globalVariables.selectedHabits = [];
              });
              print("After clear : ${globalVariables.patientGender}");
              NavigationService().navigateToScreen(PatientPrescriptionPage());
            },
            child: Icon(
              Icons.highlight_off,
              color: Colors.white,
              size: 45,
            ),
          ),
          title: Text(
            "Update Patient Details",
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
                  vm.updatePatient(
                      globalVariables.profileImagePath,
                      globalVariables.ageController.text,
                      globalVariables.patientGender,
                      globalVariables.dropdownvalue,
                      context);
Future.delayed(Duration(seconds: 1));
                  setState(() {
                    globalVariables.patientsGender = null;
                    globalVariables.patientAgeType = "";
                    globalVariables.patientGender = "";
                    globalVariables.profileImagePath = "";
                    globalVariables.ageController.text = "";
                    globalVariables.dropdownvalue = "Years";
                    globalVariables.selectedDisease = [];
                    globalVariables.selectedAllergy = [];
                    globalVariables.selectedHabits = [];
                  });
                  print("After clear : ${globalVariables.patientGender}");
                  NavigationService().navigateToScreen(PatientPrescriptionPage());
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
          children: [
            PatientPersonalInfopage(),
            AllergiesPage(),
            HistoryPage(),
            HabitPage()
          ],
        ),
      ),
    );
  }
}
