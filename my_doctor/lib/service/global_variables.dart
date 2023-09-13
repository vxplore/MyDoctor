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
  var specialityName = [
    "A RhD positive (A+)",
    "A RhD negative (A-)",
    "B RhD positive (B+)",
    "B RhD negative (B-)",
    "O RhD positive (O+)",
    "O RhD negative (O-)",
    "AB RhD positive (AB+)",
    "AB RhD negative (AB-)"
  ];

}

// Create an instance of the singleton class
final globalVariables = GlobalVariables();
