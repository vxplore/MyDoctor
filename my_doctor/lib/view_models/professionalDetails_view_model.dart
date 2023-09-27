import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_doctor/service/global_variables.dart';
import 'package:my_doctor/service/navigation_service.dart';
import 'package:http/http.dart' as http;
import '../core/di/di.dart';
import '../core/repository/preference_repo.dart';
import '../core/utilites/professional_add_response_data.dart';
import '../core/utilites/speciality_dropdown_data.dart';
import '../pages/congratulations_page.dart';
import '../pages/main_dashboard_page.dart';

part 'professionalDetails_view_model.g.dart';

class ProfessionalDetailsViewModel = _ProfessionalDetailsViewModel
    with _$ProfessionalDetailsViewModel;

abstract class _ProfessionalDetailsViewModel with Store {
  @observable
  TextEditingController registrationNumberController = TextEditingController();
  @observable
  TextEditingController stateMedicalCouncilController = TextEditingController();
  @observable
  TextEditingController specialityController = TextEditingController();
  @observable
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

  List<Specialization> res = List.empty();

  Future<SpecialityDropdownData?> getSpecialitydropdowndataApi() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.v-xplore.com/dev/rohan/e-prescription/user/docter/specialization'));

    http.StreamedResponse response = await request.send();

    var rr = "";
    if (response.statusCode == 200) {
      rr = await response.stream.bytesToString();
      print(rr);
      res = SpecialityDropdownData.fromJson(rr).data.specializations;
      globalVariables.specialityapiName =
          res.map((e) => e.name.toString()).toList();
      print(globalVariables.specialityapiName);
    } else {
      return null;
    }
    return null;
  }

  String findIdByName(String name) {
    for (var i = 0; i < res.length; i++) {
      var item = res[i];
      if (item.name == name) {
        return item.id;
      }
    }
    return "";
  }

  Future addProfessionalDetailsApi(String specialtyIds, String kycFontpic,
      String kycBackpic, BuildContext context) async {
    final prefs = dependency<PreferenceRepo>();
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/user/doctor/details'));
    request.fields.addAll({
      'userId': prefs.userid() ?? "",
      'stateMedicalCouncil': stateMedicalCouncilController.text,
      'specialityId': specialtyIds,
      'yearsOfExperience': yearsOfExperienceController.text,
      'regNo': registrationNumberController.text
    });
    request.files
        .add(await http.MultipartFile.fromPath('kycFontPic', kycFontpic));
    request.files
        .add(await http.MultipartFile.fromPath('kycBackPic', kycBackpic));

    http.StreamedResponse response = await request.send();

    var rr = "";
    if (response.statusCode == 200) {
      rr = await response.stream.bytesToString();
      print(rr);
      var cccaaaaq = ProfessionaladdResponseData.fromJson(rr);
      if (cccaaaaq.data.isAdded == true) {
        globalVariables.isAddApiLoading = cccaaaaq.data.isAdded;
        const snackdemo = SnackBar(
          content: Text('Details Added'),
          backgroundColor: Colors.green,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
        NavigationService().navigateToScreen(CongratulationsPage());
      } else {
        const snackdemo = SnackBar(
          content: Text('Something went wrong please try again'),
          backgroundColor: Colors.red,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      }

      return cccaaaaq;
    } else {
      return null;
    }
  }
}
