import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:my_doctor/core/utilites/register_response_data.dart';
import 'package:my_doctor/pages/otp_page.dart';
import 'package:http/http.dart' as http;
import '../core/di/di.dart';
import '../core/repository/preference_repo.dart';
import '../service/navigation_service.dart';

part 'registration_view_model.g.dart';

class RegistrationViewModel = _RegistrationViewModel
    with _$RegistrationViewModel;

abstract class _RegistrationViewModel with Store {
  @observable
  TextEditingController nameController = TextEditingController();
  @observable
  TextEditingController mobileController = TextEditingController();
  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController passwordController = TextEditingController();
  @observable
  TextEditingController reenterpassowrdController = TextEditingController();

  nextStep() {
    NavigationService().navigateToScreen(OtpPage(mobileController.text));
  }

  bool isAllFieldComplete() {
    if (nameController.text.isNotEmpty &&
        mobileController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        reenterpassowrdController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool isValidEmail(String emails) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(emails);
  }

  final prefs = dependency<PreferenceRepo>();

  Future registrationApi(String img) async {
    if (img == "") {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'https://www.v-xplore.com/dev/rohan/e-prescription/user/docter'));
      request.fields.addAll({
        'name': nameController.text,
        'number': mobileController.text,
        'email': emailController.text,
        'password': passwordController.text
      });
      // request.files.add(await http.MultipartFile.fromPath('image', ""));

      http.StreamedResponse response = await request.send();
      var rr = "";
      if (response.statusCode == 200) {
        rr = await response.stream.bytesToString();
        print(rr);
        var cccaaaaq = RegisterResponseData.fromJson(rr);

        if (cccaaaaq.data.isAdded == true) {
          prefs.setUserId(cccaaaaq.data.userId);
          nextStep();
        }

        return cccaaaaq;
      } else {
        return null;
      }
    } else {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'https://www.v-xplore.com/dev/rohan/e-prescription/user/docter'));
      request.fields.addAll({
        'name': nameController.text,
        'number': mobileController.text,
        'email': emailController.text,
        'password': passwordController.text
      });
      request.files.add(await http.MultipartFile.fromPath('image', img));

      http.StreamedResponse response = await request.send();
      var rr = "";
      if (response.statusCode == 200) {
        rr = await response.stream.bytesToString();
        print(rr);
        var cccaaaaq = RegisterResponseData.fromJson(rr);

        if (cccaaaaq.data.isAdded == true) {
          prefs.setUserId(cccaaaaq.data.userId);
          nextStep();
        }

        return cccaaaaq;
      } else {
        return null;
      }
    }
  }

/* testImageUploadApi(String img) async {
    var request = http.MultipartRequest('POST',
        Uri.parse('https://webhook.site/77583f10-00d7-481c-b205-fb3e1acf3e43'));
    request.files.add(await http.MultipartFile.fromPath('myimage',
        img));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }*/
}
