import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

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
}

// Create an instance of the singleton class
final globalVariables = GlobalVariables();
