import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_doctor/core/repository/api_repo.dart';
import 'package:my_doctor/core/utilites/register_response_data.dart';
import 'package:my_doctor/pages/otp_page.dart';
import 'package:http/http.dart' as http;
import 'package:my_doctor/service/global_variables.dart';
import '../core/di/di.dart';
import '../core/repository/preference_repo.dart';
import '../core/repository/repository.dart';
import '../service/navigation_service.dart';

part 'registration_view_model.g.dart';

class RegistrationViewModel = _RegistrationViewModel
    with _$RegistrationViewModel;

abstract class _RegistrationViewModel with Store {
  TextEditingController nameController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController reenterpassowrdController = TextEditingController();

  nextStep() {
    globalVariables.docname = nameController.text;
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

  Future registration(String img, BuildContext context) async {
    final repo = dependency<Repository>();
    var response = await repo.register(
        nameController.text,
        mobileController.text,
        emailController.text,
        passwordController.text,
        img);
    if (response == null) {
      var snackdemo = SnackBar(
        content: Text('Something went wrong...please try again!!!'),
        backgroundColor: Colors.red,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
    } else {
      if (response.isAdded == true) {
        prefs.setUserId(response.userId);
        var snackdemo = SnackBar(
          content: Text('${response.message}'),
          backgroundColor: Colors.green,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
        nextStep();
      } else {
        var snackdemo = SnackBar(
          content: Text('${response.message}'),
          backgroundColor: Colors.red,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      }
    }
  }

  onNextStepButtonClicked(String img, BuildContext context) {
    registration(img, context);
  }
}
