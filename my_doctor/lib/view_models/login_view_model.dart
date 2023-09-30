import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_doctor/pages/main_dashboard_page.dart';
import 'package:my_doctor/pages/registration_page.dart';
import 'package:http/http.dart' as http;
import '../core/di/di.dart';
import '../core/repository/preference_repo.dart';
import '../core/utilites/login_response_data.dart';
import '../service/navigation_service.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModel with _$LoginViewModel;

abstract class _LoginViewModel with Store {
  final prefs = dependency<PreferenceRepo>();
  @observable
  String? showToast;
  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController passwordController = TextEditingController();

  registration() {
    NavigationService().navigateToScreen(RegistrationPage());
  }

  Future loginApi(BuildContext context) async {
    var request = http.MultipartRequest('POST',
        Uri.parse('https://www.v-xplore.com/dev/rohan/e-prescription/login'));
    request.fields.addAll(
        {'email': emailController.text, 'password': passwordController.text});

    http.StreamedResponse response = await request.send();

    var rr = "";
    if (response.statusCode == 200) {
      rr = await response.stream.bytesToString();
      print(rr);
      var cccaaaaq = LoginResponseData.fromJson(rr);
      if (cccaaaaq.data.isMatched == true) {
        prefs.setUserId(cccaaaaq.data.userId);
        const snackdemo = SnackBar(
          content: Text('Login Successful'),
          backgroundColor: Colors.green,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
        NavigationService().navigateToScreen(MainDashboardPage());
      }else{
        const snackdemo = SnackBar(
          content: Text('Please Give Correct Login Details'),
          backgroundColor: Colors.red,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      }

      return cccaaaaq;
    } else {
      return null;
    }
  }
}
