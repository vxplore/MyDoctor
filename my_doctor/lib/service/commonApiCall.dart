import 'package:my_doctor/core/repository/api_repo.dart';

import '../core/di/di.dart';
import '../core/repository/preference_repo.dart';
import '../core/utilites/getDoctorDetails_response_data.dart';
import 'global_variables.dart';

class CommonApiCall {
  Future<GetdoctordetailsResponseData?> getDoctorDetailsApi() async {
    final prefs = dependency<PreferenceRepo>();
    final getDoctorDetailsApiRepo = dependency<ApiRepository>();
    var result =
        await getDoctorDetailsApiRepo.getdoctordetails(prefs.userid() ?? "");
    /* var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/user/doctor/details?doctorId=USRD08C49811695723244'));

    http.StreamedResponse response = await request.send();*/

    var rr = "";
    if (result.statusCode == 200) {
      rr = await result.stream.bytesToString();
      print(rr);
      var resps = GetdoctordetailsResponseData.fromJson(rr);
      globalVariables.getDoctorDetailsFromApi = resps;
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
