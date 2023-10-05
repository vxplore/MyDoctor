import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_doctor/core/di/di.dart';
import 'package:http/http.dart' as http;
import 'package:my_doctor/core/repository/api_repo.dart';
import 'package:my_doctor/service/global_variables.dart';
import '../core/repository/preference_repo.dart';
import '../core/utilites/addPatientPersonalInfo_response_data.dart';

part 'addPatientPersonalInfo_view_model.g.dart';

class AddPatientPersonalInfoViewModel = _AddPatientPersonalInfoViewModel
    with _$AddPatientPersonalInfoViewModel;

abstract class _AddPatientPersonalInfoViewModel with Store {
  Future<AddpatientpersonalinfoResponseData?> addPatientPersonalDetailsApi(
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

    /* var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'https://v-xplore.com/dev/rohan/e-prescription/user/patient'));
      request.fields.addAll({
        'doctorId': prefs.userid() ?? "",
        'name': globalVariables.fullNameController.text,
        'age': age,
        'number': globalVariables.mobileNumberController.text,
        'gender': gender,
        'ageType': ageTypes
      });

      http.StreamedResponse response = await request.send();*/
    final addPatientPersonalInfoApiRepo = dependency<ApiRepository>();
    var result = await addPatientPersonalInfoApiRepo.addpatientpersonalinfo(
        prefs.userid() ?? "", img, age, gender, ageTypes);
    var rr = "";
    if (result.statusCode == 200) {
      rr = await result.stream.bytesToString();
      print(rr);
      var resps = AddpatientpersonalinfoResponseData.fromJson(rr);

      if (resps.data.isAdded == true) {
        var snackdemo = SnackBar(
          content: Text("${resps.data.message}"),
          backgroundColor: Colors.green,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
        // Get.to(() => BottomNavBar());
      } else {
        var snackdemo = SnackBar(
          content: Text("${resps.data.message}"),
          backgroundColor: Colors.red,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      }
      return resps;
    } else {
      return null;
    }
  }
}
