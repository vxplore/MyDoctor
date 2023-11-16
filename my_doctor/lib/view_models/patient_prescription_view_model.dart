import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:my_doctor/service/global_variables.dart';

import '../core/utilites/getPatientDetails_response_data.dart';

part 'patient_prescription_view_model.g.dart';

class PatientPrescriptionViewModel = _PatientPrescriptionViewModel
    with _$PatientPrescriptionViewModel;

abstract class _PatientPrescriptionViewModel with Store {
  Future<GetpatientdetailsResponseData?> getPatientDetails() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/user/patient/details?patient_id=${globalVariables.patientId}'));

    http.StreamedResponse response = await request.send();

    var rr = "";
    if (response.statusCode == 200) {
      rr = await response.stream.bytesToString();
      print(rr);
      var resp = GetpatientdetailsResponseData.fromJson(rr);
      return resp;
    } else {
      return null;
    }
  }
}
