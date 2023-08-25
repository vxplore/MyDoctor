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


// String? get myString => _myString;

// set myString(String? newValue) {
//   myString = newValue;
// }
}

// Create an instance of the singleton class
final globalVariables = GlobalVariables();
