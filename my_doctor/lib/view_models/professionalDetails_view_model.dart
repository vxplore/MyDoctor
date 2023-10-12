import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_doctor/core/repository/api_repo.dart';
import 'package:my_doctor/service/global_variables.dart';
import 'package:my_doctor/service/navigation_service.dart';
import 'package:http/http.dart' as http;
import '../core/di/di.dart';
import '../core/repository/preference_repo.dart';
import '../core/repository/repository.dart';
import '../core/utilites/professional_add_response_data.dart';
import '../core/utilites/speciality_dropdown_data.dart';
import '../pages/congratulations_page.dart';
import '../pages/main_dashboard_page.dart';

part 'professionalDetails_view_model.g.dart';

class ProfessionalDetailsViewModel = _ProfessionalDetailsViewModel
    with _$ProfessionalDetailsViewModel;

abstract class _ProfessionalDetailsViewModel with Store {

  TextEditingController registrationNumberController = TextEditingController();

  TextEditingController stateMedicalCouncilController = TextEditingController();

  TextEditingController specialityController = TextEditingController();

  TextEditingController yearsOfExperienceController = TextEditingController();

  bool isAllFieldComplete() {
    if (registrationNumberController.text.isNotEmpty &&
        stateMedicalCouncilController.text.isNotEmpty &&
        yearsOfExperienceController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  onNextPageClicked() {
    NavigationService().navigateToScreen(CongratulationsPage());
  }

  Future getSpecialitydropdowndata() async {
    final repo = dependency<Repository>();

    await repo.getdoctorspecializationlist();
  }

  String findIdByName(String name) {
    for (var i = 0; i < globalVariables.res.length; i++) {
      var item = globalVariables.res[i];
      if (item.name == name) {
        return item.id;
      }
    }
    return "";
  }

  Future addProfessionalDetails(String specialtyIds, String kycFontpic,
      String kycBackpic, BuildContext context) async {
    final prefs = dependency<PreferenceRepo>();
    final repo = dependency<Repository>();
    var response = await repo.addprofessionaldetails(
        specialtyIds,
        kycFontpic,
        kycBackpic,
        prefs.userid() ?? "",
        stateMedicalCouncilController.text,
        yearsOfExperienceController.text,
        registrationNumberController.text);
    if (response == null) {
      var snackdemo = SnackBar(
        content: Text('Something went wrong..please try again!!!!'),
        backgroundColor: Colors.red,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
    } else {
      if (response.isAdded == true) {
        globalVariables.isAddApiLoading = response.isAdded;
        var snackdemo = SnackBar(
          content: Text('${response.message}'),
          backgroundColor: Colors.green,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
        NavigationService().navigateToScreen(CongratulationsPage());
      } else {
        var snackdemo = SnackBar(
          content: Text('${response.message}'),
          backgroundColor: Colors.red,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      }
    }
  }

  onNextStepButtonClicked(String specialtyIds, String kycFontpic,
      String kycBackpic, BuildContext context) {
    addProfessionalDetails(specialtyIds, kycFontpic, kycBackpic, context);
  }
}
