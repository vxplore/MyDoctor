import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:my_doctor/service/global_variables.dart';
import 'package:my_doctor/service/navigation_service.dart';
import 'package:http/http.dart' as http;
import '../core/utilites/speciality_dropdown_data.dart';
import '../pages/congratulations_page.dart';

part 'professionalDetails_view_model.g.dart';

class ProfessionalDetailsViewModel = _ProfessionalDetailsViewModel
    with _$ProfessionalDetailsViewModel;

abstract class _ProfessionalDetailsViewModel with Store {
  // List<Specialization> specializations = [];
  List myList = [];
  /*void saveSpecializationsFromJson(Map<String, dynamic> jsonData) {
    final List<dynamic> specializationData = jsonData['data']['specializations'];
    specializations = specializationData
        .map((item) => Specialization.fromJson(item))
        .toList();
  }*/
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
        specialityController.text.isNotEmpty &&
        yearsOfExperienceController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  onNextPageClicked() {
    NavigationService().navigateToScreen(CongratulationsPage());
  }

  Future<SpecialityDropdownData?> getSpecialitydropdowndataApi()async{
    var request = http.Request('GET', Uri.parse('https://www.v-xplore.com/dev/rohan/e-prescription/user/docter/specialization'));


    http.StreamedResponse response = await request.send();

    var rr = "";
    if (response.statusCode == 200) {
      rr = await response.stream.bytesToString();
      print(rr);
      var res = SpecialityDropdownData.fromJson(rr).data.specializations;
     globalVariables.specialityName = res.map((e) => e.name.toString()).toList();
      print(globalVariables.specialityName);
    } else {
      return null;
    }
  }
}
