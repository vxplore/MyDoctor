import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_doctor/core/repository/api_repo.dart';
import 'package:my_doctor/pages/main_dashboard_page.dart';
import 'package:my_doctor/pages/registration_page.dart';
import 'package:http/http.dart' as http;
import '../core/di/di.dart';
import '../core/repository/preference_repo.dart';
import '../core/repository/repository.dart';
import '../core/utilites/login_response_data.dart';
import '../service/navigation_service.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModel with _$LoginViewModel;

abstract class _LoginViewModel with Store {
  final prefs = dependency<PreferenceRepo>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  registration() {
    NavigationService().navigateToScreen(RegistrationPage());
  }

  Future login(BuildContext context) async {
    final repo = dependency<Repository>();
    var response =
        await repo.login(emailController.text, passwordController.text);
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
      if (response.isMatched == true) {
        prefs.setUserId(response.userId);
        var snackdemo = SnackBar(
          content: Text('${response.message}'),
          backgroundColor: Colors.green,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
        NavigationService().navigateToScreen(MainDashboardPage());
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

  onLoginButtonClicked(BuildContext context) {
    print("onLoginButtonClicked 1st");
    login(context);
    print("onLoginButtonClicked 2st");
  }
}
