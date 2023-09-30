import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import '../core/di/di.dart';
import '../core/repository/preference_repo.dart';
import '../core/utilites/getAllPatients_response_data.dart';
import '../service/global_variables.dart';

part 'myPatient_view_model.g.dart';

class MyPatientViewModel = _MyPatientViewModel
    with _$MyPatientViewModel;

abstract class _MyPatientViewModel with Store {
  final prefs = dependency<PreferenceRepo>();

  Future<GetallpatientsResponseData?> getAllPatientApi() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/user/patient/list?doctorId=${prefs.userid() ?? ""}'));

    http.StreamedResponse response = await request.send();

    var rr = "";
    if (response.statusCode == 200) {
      rr = await response.stream.bytesToString();
      print(rr);
      var resps = GetallpatientsResponseData.fromJson(rr);
      globalVariables.getAllPatientsFromApi = resps;
      /* if (resps.status == true) {
        prefs.setUserId(resps.data.userId);
        Get.snackbar("Success", "OTP Verified",
            snackPosition: SnackPosition.BOTTOM);
        // Get.to(() => BottomNavBar());
        NavigationService().navigateToScreen(BottomNavBar());
        otpController.clear();
      } else {
        Get.snackbar("Error", resps.message,
            snackPosition: SnackPosition.BOTTOM, colorText: kRedColor);
      }*/
      return resps;
    } else {
      return null;
    }
  }
}
