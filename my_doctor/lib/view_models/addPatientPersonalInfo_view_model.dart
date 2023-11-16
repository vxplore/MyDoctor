import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_doctor/core/di/di.dart';
import 'package:http/http.dart' as http;
import 'package:my_doctor/core/repository/api_repo.dart';
import 'package:my_doctor/service/global_variables.dart';
import '../core/repository/preference_repo.dart';
import '../core/repository/repository.dart';
import '../core/utilites/addPatientPersonalInfo_response_data.dart';

part 'addPatientPersonalInfo_view_model.g.dart';

class AddPatientPersonalInfoViewModel = _AddPatientPersonalInfoViewModel
    with _$AddPatientPersonalInfoViewModel;

abstract class _AddPatientPersonalInfoViewModel with Store {
  Future addPatientPersonalDetails(
      String img,
      String age,
      String gender,
      String ageTypes,
      BuildContext context) async {
    final prefs = dependency<PreferenceRepo>();
    print("add patient img : ${img}");
    print("add patient age : ${age}");
    print("add patient gender : ${gender}");
    print("add patient ageatype : ${ageTypes}");
    print("add patient name : ${globalVariables.fullNameController.text}");
    print(
        "add patient number : ${globalVariables.mobileNumberController.text}");

    final repo = dependency<Repository>();
    var response = await repo.addpatientpersonalinfo(
        prefs.userid() ?? "", img, age, gender, ageTypes);

    if (response == null) {
      var snackdemo = SnackBar(
        content: Text("Something went wrong"),
        backgroundColor: Colors.red,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
    } else {
      if (response.isAdded == true) {
        var snackdemo = SnackBar(
          content: Text("${response.message}"),
          backgroundColor: Colors.green,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
        // Get.to(() => BottomNavBar());
      } else {
        var snackdemo = SnackBar(
          content: Text("${response.message}"),
          backgroundColor: Colors.red,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      }
    }
  }

}
