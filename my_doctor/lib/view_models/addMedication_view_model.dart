import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

import '../core/utilites/getMedicineDosageDuration_response_data.dart';
import '../core/utilites/getMedicineDosageForm_response_data.dart';
import '../core/utilites/getMedicineDosageQuantity_response_data.dart';
import '../core/utilites/getMedicineDosageRegimen_response_data.dart';
import '../core/utilites/getMedicineName_response_data.dart';
import '../service/global_variables.dart';

part 'addMedication_view_model.g.dart';

class AddMedicationViewModel = _AddMedicationViewModel
    with _$AddMedicationViewModel;

abstract class _AddMedicationViewModel with Store {
  Future<GetmedicinedosageformResponseData?> getMedicineDosageFormApi() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/medicine/dosage-types'));

    http.StreamedResponse response = await request.send();

    var rr = "";
    if (response.statusCode == 200) {
      rr = await response.stream.bytesToString();
      print(rr);
      var resps = GetmedicinedosageformResponseData.fromJson(rr);
      globalVariables.getDosageFormFromApi = resps;
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

  Future<GetmedicinenameResponseData?> getMedicineNameApi() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/medicine/name'));

    http.StreamedResponse response = await request.send();

    var rr = "";
    if (response.statusCode == 200) {
      rr = await response.stream.bytesToString();
      print(rr);
      var resps = GetmedicinenameResponseData.fromJson(rr);
      globalVariables.getMedicineNameFromApi = resps;
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

  Future<GetmedicinedodagequantityResponseData?>
      getMedicineDosageQuantityApi() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/medicine/dose'));

    http.StreamedResponse response = await request.send();

    var rr = "";
    if (response.statusCode == 200) {
      rr = await response.stream.bytesToString();
      print(rr);
      var resps = GetmedicinedodagequantityResponseData.fromJson(rr);
      globalVariables.getMedicineDosageQuantityFromApi = resps;
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

  Future<GetmedicinedodageregimenResponseData?>
      getMedicineDosageRegimenApi() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/medicine/regimen'));

    http.StreamedResponse response = await request.send();

    var rr = "";
    if (response.statusCode == 200) {
      rr = await response.stream.bytesToString();
      print(rr);
      var resps = GetmedicinedodageregimenResponseData.fromJson(rr);
      globalVariables.getMedicineDosageRegimenFromApi = resps;
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

  Future<GetmedicinedodagedurationResponseData?>
      getMedicineDosageDurationApi() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/medicine/duration'));

    http.StreamedResponse response = await request.send();

    var rr = "";
    if (response.statusCode == 200) {
      rr = await response.stream.bytesToString();
      print(rr);
      var resps = GetmedicinedodagedurationResponseData.fromJson(rr);
      globalVariables.getMedicineDosageDurationFromApi = resps;
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
