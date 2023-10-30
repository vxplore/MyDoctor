import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:my_doctor/core/di/di.dart';
import 'package:my_doctor/core/repository/api_repo.dart';
import '../core/repository/repository.dart';
import '../core/utilites/addMedicine_response_data.dart';
import '../core/utilites/getMedicineDosageDuration_response_data.dart';
import '../core/utilites/getMedicineDosageForm_response_data.dart';
import '../core/utilites/getMedicineDosageQuantity_response_data.dart';
import '../core/utilites/getMedicineDosageRegimen_response_data.dart';
import '../core/utilites/getMedicineList_response_data.dart';
import '../core/utilites/getMedicineName_response_data.dart';
import '../pages/addMedication_page.dart';
import '../service/global_variables.dart';

part 'addMedication_view_model.g.dart';

class AddMedicationViewModel = _AddMedicationViewModel
    with _$AddMedicationViewModel;

abstract class _AddMedicationViewModel with Store {
  Future<GetmedicinedosageformResponseData?> getMedicineDosageFormApi() async {
    final getMedicineDosageFormApiRepo = dependency<ApiRepository>();
    var result = await getMedicineDosageFormApiRepo.getmedicinedosageform();
    /* var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/medicine/dosage-types'));

    http.StreamedResponse response = await request.send();*/

    var rr = "";
    if (result.statusCode == 200) {
      rr = await result.stream.bytesToString();
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
    /* var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/medicine/name'));

    http.StreamedResponse response = await request.send();*/
    final getMedicineNameApirepo = dependency<ApiRepository>();
    var result = await getMedicineNameApirepo.getmedicinename();
    var rr = "";
    if (result.statusCode == 200) {
      rr = await result.stream.bytesToString();
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
    final getMedicineDosageQuantityApiRepo = dependency<ApiRepository>();
    var result =
        await getMedicineDosageQuantityApiRepo.getmedicinedosagequantity();
    /* var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/medicine/dose'));

    http.StreamedResponse response = await request.send();*/

    var rr = "";
    if (result.statusCode == 200) {
      rr = await result.stream.bytesToString();
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
    /* var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/medicine/regimen'));

    http.StreamedResponse response = await request.send();*/
    final getMedicineDosageRegimenApiRepo = dependency<ApiRepository>();
    var result =
        await getMedicineDosageRegimenApiRepo.getmedicinedosageregimen();
    var rr = "";
    if (result.statusCode == 200) {
      rr = await result.stream.bytesToString();
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
    /*var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/medicine/duration'));

    http.StreamedResponse response = await request.send();*/
    final getMedicineDosageDurationsApiRepo = dependency<ApiRepository>();
    var result =
        await getMedicineDosageDurationsApiRepo.getmedicinedosagedurations();
    var rr = "";
    if (result.statusCode == 200) {
      rr = await result.stream.bytesToString();
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

  Future addMedicineApi(BuildContext context) async {
    print("add medicine patientid :: ${globalVariables.patientId}");
    print("add medicine medNameId :: ${globalVariables.nameId}");
    print("add medicine medFormId :: ${globalVariables.dosageFormId}");
    print(
        "add medicine medTimeId :: ${globalVariables.dataFromDialogdoseregimen}");
    print("add medicine medDoseId :: ${globalVariables.doseId}");
    print("add medicine medDurationId :: ${globalVariables.durationsId}");
    print("add medicine medRegimenId :: ${globalVariables.doseregimenId}");
    print("add medicine startFrom :: ${globalVariables.startMediactionFrom}");
    print("add medicine remarks :: ${globalVariables.medicineRemarks}");
    print("add medicine language :: ${globalVariables.selectedLanguage}");
    final repo = dependency<Repository>();
    var response = await repo.addmedicine();

    if (response == null) {
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
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddMedicationPage(pharmacyname:  globalVariables.pharmacynamess!,)));
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

  Future getMedicinesApi() async {
    final repo = dependency<Repository>();
    var response = await repo.getmedicinelists();
    if(response == null){}
    else{
      globalVariables.getMedicineListFromApi = response;
    }
  }
  }

