import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../core/utilites/getAllPatients_response_data.dart';
import '../core/utilites/getDoctorDetails_response_data.dart';
import '../core/utilites/getMedicineDosageDuration_response_data.dart';
import '../core/utilites/getMedicineDosageForm_response_data.dart';
import '../core/utilites/getMedicineDosageQuantity_response_data.dart';
import '../core/utilites/getMedicineDosageRegimen_response_data.dart';
import '../core/utilites/getMedicineList_response_data.dart';
import '../core/utilites/getMedicineName_response_data.dart';
import '../core/utilites/speciality_dropdown_data.dart';

class GlobalVariables {
  static final GlobalVariables _singleton = GlobalVariables._internal();

  factory GlobalVariables() {
    return _singleton;
  }

  GlobalVariables._internal();
  List<String> selectedClinicNames = [];
  String selectedAssistantRoleNames = "";
  List<Map<String, dynamic>> selectedItems = [];
  List<Map<String, dynamic>> finalselectedItems = [];
  String pharmacynamess = "";
  String labNamess = "";
  List<Map<String, dynamic>> medicinelists = [];
  List<Map<String, dynamic>> selectedAllergy = [];
  String selectedAllergyJson = "";
  String selectedDiseaseJson = "";
  String selectedHabitsJson = "";
  List<String> selectedDisease = [];
  List<String> selectedHabits = [];
  List<Specialization> res = List.empty();
  bool isOtpFromForgotPassword = false;
  String? medId;
  String? patientId;
  String? patientImg;
  String patientPhNumber = "";
  String patientEmails = "";
  String patientName = "";
  String patientAge = "";
  String patientAgeType = "";
  String patientAgeTypeprefil = "";
  String? patientsGender;
  String? dosageFormId;
  String? dosageform;
  String? dose;
 String docname = "";
  String? doseId;
  String? names;
  String? nameId;
  String? doseregimen;
  String? doseregimenId;
  String? dataFromDialogdoseregimen;
  String? durations;
  String? durationsId;
  String? startMediactionFrom;
  String? selectedLanguage;
  String? medicineRemarks;
  bool isDoseRegimentPageIndexChange = false;
  XFile? image;
  XFile? fontimage;
  XFile? backimage;
  String patientGender = "";
  String dropdownvalue = "Years";
  var profileImagePath = '';
  TextEditingController ageController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailsController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController bmiController = TextEditingController();
  TextEditingController referredByController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
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
  GetdoctordetailsResponseData? getDoctorDetailsFromApi;
  GetdoctordetailsResponseData? getDoctorDetails;
  GetmedicinesResponseData? getMedicineListFromApi;
  GetmedicinesResponseData? getMedicineList;
}

// Create an instance of the singleton class
final globalVariables = GlobalVariables();
