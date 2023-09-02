import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:my_doctor/pages/otp_page.dart';

import '../service/navigation_service.dart';
part 'registration_view_model.g.dart';
class RegistrationViewModel = _RegistrationViewModel with _$RegistrationViewModel;



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

  nextStep(){
    NavigationService().navigateToScreen(OtpPage(emailController.text));
  }

  bool isAllFieldComplete(){
    if(nameController.text.isNotEmpty && mobileController.text.isNotEmpty && emailController.text.isNotEmpty && passwordController.text.isNotEmpty && reenterpassowrdController.text.isNotEmpty){
      return true;
    }else{
      return false;
    }

  }

}
