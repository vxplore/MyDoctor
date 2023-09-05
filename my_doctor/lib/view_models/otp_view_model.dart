import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import '../pages/professionalDetails_page.dart';
import '../service/navigation_service.dart';
part 'otp_view_model.g.dart';

class OtpViewModel = _OtpViewModel with _$OtpViewModel;

abstract class _OtpViewModel with Store {
  @observable
  TextEditingController otpController = TextEditingController();
  @observable
  String? showToast;

  bool isOtpFieldFilled() {
    if (otpController.text.isNotEmpty) {
      print(otpController.text);
      return true;
    } else {
      return false;
    }
  }
   isOtpVerified(){
    if(otpController.text == "12345"){
      showToast = "Verified";
      NavigationService().navigateToScreen(ProfessionalDetailsPage());
    }else{
      showToast = " Not Matched";
    }
  }
}
