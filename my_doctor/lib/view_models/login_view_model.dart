import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:my_doctor/pages/dashboard_page.dart';
import 'package:my_doctor/pages/registration_page.dart';

import '../service/navigation_service.dart';
part 'login_view_model.g.dart';
class LoginViewModel = _LoginViewModel with _$LoginViewModel;



abstract class _LoginViewModel with Store {
  @observable
  String? showToast;
  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController passwordController = TextEditingController();

  login() {

    if (emailController.text == "arpan@gmail.com" && passwordController.text == "123456" ) {
      NavigationService().navigateToScreen(DashboardPage());
      showToast = "Otp Matched";
    } else {
      showToast = "Not Matched";
    }
  }

  registration(){
    NavigationService().navigateToScreen(RegistrationPage());
  }
}