import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:my_doctor/service/global_variables.dart';

part 'update_patient_view_model.g.dart';

class UpdatePatientViewModel = _UpdatePatientViewModel
    with _$UpdatePatientViewModel;

abstract class _UpdatePatientViewModel with Store {
  Future updatePatient(String img, String age, String gender, String ageTypes,
      BuildContext context) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/user/patient/update'));
    request.fields.addAll({
      'p_id': globalVariables.patientId!,
      'name': globalVariables.fullNameController.text,
      'phone': globalVariables.mobileNumberController.text,
      'age': age,
      'age_type': ageTypes,
      'gender': gender,
      'email': globalVariables.emailsController.text,
      'height': '5.3',
      'weight': '50',
      'BMI': '120',
      'allergy': globalVariables.selectedAllergyJson,
      'diseases_history': globalVariables.selectedDiseaseJson,
      'habits': globalVariables.selectedHabitsJson
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
