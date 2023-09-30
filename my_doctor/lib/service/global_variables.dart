import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../core/utilites/getAllPatients_response_data.dart';
import '../core/utilites/getMedicineDosageDuration_response_data.dart';
import '../core/utilites/getMedicineDosageForm_response_data.dart';
import '../core/utilites/getMedicineDosageQuantity_response_data.dart';
import '../core/utilites/getMedicineDosageRegimen_response_data.dart';
import '../core/utilites/getMedicineName_response_data.dart';

class GlobalVariables {
  static final GlobalVariables _singleton = GlobalVariables._internal();

  factory GlobalVariables() {
    return _singleton;
  }

  GlobalVariables._internal();

  String? dosageform;
  String? dose;
  String? names;
  String? doseregimen;
  String? dataFromDialog;
  String? durations;
  String? startMediactionFrom;
  String? selectedLanguage;
  bool isDoseRegimentPageIndexChange = false;
  XFile? image;
  XFile? fontimage;
  XFile? backimage;
  String? patientGender;
  String dropdownvalue = "Years";
  var profileImagePath = '';
  TextEditingController ageController = TextEditingController();
  var specialityapiName = [""];
  var specialityName = [""];
  String specialtyId = "";
  bool isAddApiLoading = false;
  GetallpatientsResponseData? getAllPatientsFromApi;
  GetallpatientsResponseData? getAllPatients;
  GetmedicinedosageformResponseData? getDosageFormFromApi;
  GetmedicinedosageformResponseData? getDosageForm;
  GetmedicinenameResponseData? getMedicineNameFromApi;
  GetmedicinenameResponseData? getMedicineName;
  GetmedicinedodagequantityResponseData? getMedicineDosageQuantityFromApi;
  GetmedicinedodagequantityResponseData? getMedicineDosageQuantity;
  GetmedicinedodageregimenResponseData? getMedicineDosageRegimenFromApi;
  GetmedicinedodageregimenResponseData? getMedicineDosageRegimen;
  GetmedicinedodagedurationResponseData? getMedicineDosageDurationFromApi;
  GetmedicinedodagedurationResponseData? getMedicineDosageDuration;

}

// Create an instance of the singleton class
final globalVariables = GlobalVariables();
