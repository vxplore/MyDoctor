import 'dart:convert';
import 'package:my_doctor/core/repository/api_repo.dart';
import 'package:http/http.dart ' as http;
import '../../service/global_variables.dart';

class ApiRepositoryImpl extends ApiRepository {
  @override
  Future<http.StreamedResponse> getdoctordetails(String docId) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/user/doctor/details?doctorId=${docId}'));

    return await request.send();
  }

  @override
  Future<http.StreamedResponse> login(String email, String password) async {
    var request = http.MultipartRequest('POST',
        Uri.parse('https://www.v-xplore.com/dev/rohan/e-prescription/login'));
    request.fields.addAll({'email': email, 'password': password});

    return await request.send();
  }

  @override
  Future<http.StreamedResponse> register(String name, String number,
      String email, String password, String image) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://www.v-xplore.com/dev/rohan/e-prescription/user/docter'));
    request.fields.addAll(
        {'name': name, 'number': number, 'email': email, 'password': password});
    if (image == "") {
      return await request.send();
    } else {
      request.files.add(await http.MultipartFile.fromPath('image', image));

      return await request.send();
    }
  }

  @override
  Future<http.StreamedResponse> otpverify(String otp, String phnumber) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://www.v-xplore.com/dev/rohan/e-prescription/verify-otp'));
    request.fields.addAll({'otp': otp, 'number': phnumber});

    return await request.send();
  }

  @override
  Future<http.StreamedResponse> getdoctorspecializationlist() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.v-xplore.com/dev/rohan/e-prescription/user/docter/specialization'));

    return await request.send();
  }

  @override
  Future<http.StreamedResponse> addprofessionaldetails(
      String specialtyIds,
      String kycFontpic,
      String kycBackpic,
      String userid,
      String stateMedicalCouncil,
      String yearsOfExperience,
      String regNo) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/user/doctor/details'));
    request.fields.addAll({
      'userId': userid,
      'stateMedicalCouncil': stateMedicalCouncil,
      'specialityId': specialtyIds,
      'yearsOfExperience': yearsOfExperience,
      'regNo': regNo
    });
    request.files
        .add(await http.MultipartFile.fromPath('kycFontPic', kycFontpic));
    request.files
        .add(await http.MultipartFile.fromPath('kycBackPic', kycBackpic));

    return await request.send();
  }

  @override
  Future<http.StreamedResponse> getpatientlists(String docId) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/user/patient/list?doctorId=${docId}'));

    return await request.send();
  }

  @override
  Future<http.StreamedResponse> addmedicine() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/medicine/add'));
    request.body = json.encode({
      "patientId": globalVariables.patientId,
      "medNameId": globalVariables.nameId,
      "medFormId": globalVariables.dosageFormId,
      "medTime": globalVariables.dataFromDialogdoseregimen,
      "medDoseId": globalVariables.doseId,
      "medDurationId": globalVariables.durationsId,
      "medRegimenId": globalVariables.doseregimenId,
      "startFrom": globalVariables.startMediactionFrom,
      "remarks": globalVariables.medicineRemarks,
      "language": globalVariables.selectedLanguage
    });
    request.headers.addAll(headers);

    return await request.send();
  }

  @override
  Future<http.StreamedResponse> getmedicinedosageform() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/medicine/dosage-types'));

    return await request.send();
  }

  @override
  Future<http.StreamedResponse> getmedicinename() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/medicine/name'));

    return await request.send();
  }

  @override
  Future<http.StreamedResponse> getmedicinedosagequantity() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/medicine/dose'));

    return await request.send();
  }

  @override
  Future<http.StreamedResponse> getmedicinedosageregimen() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/medicine/regimen'));

    return await request.send();
  }

  @override
  Future<http.StreamedResponse> getmedicinedosagedurations() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/medicine/duration'));

    return await request.send();
  }

  @override
  Future<http.StreamedResponse> addpatientpersonalinfo(String userid,
      String img, String age, String gender, String ageTypes) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/user/patient'));
    request.fields.addAll({
      'doctorId': userid,
      'name': globalVariables.fullNameController.text,
      'age': age,
      'number': globalVariables.mobileNumberController.text,
      'gender': gender,
      'ageType': ageTypes
    });
    if (img == "") {
      return await request.send();
    } else {
      request.files.add(await http.MultipartFile.fromPath('image', img));

      return await request.send();
    }
  }

  @override
  Future<http.StreamedResponse> getmedicinelists() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/user/patient/medicine?patient_id=${globalVariables.patientId}'));

    return await request.send();
  }

  @override
  Future<http.StreamedResponse> verifymobileno(String phNo) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/verify-number?number=${phNo}'));

    return await request.send();
  }
}
