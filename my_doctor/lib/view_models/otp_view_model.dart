import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_doctor/core/repository/api_repo.dart';
import 'package:my_doctor/service/global_variables.dart';
import '../core/di/di.dart';
import '../core/repository/preference_repo.dart';
import '../core/utilites/otp_response_data.dart';
import '../pages/main_dashboard_page.dart';
import '../pages/professionalDetails_page.dart';
import '../service/navigation_service.dart';
import 'package:http/http.dart' as http;

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

  /*isOtpVerified(){
    if(otpController.text == "12345"){
      showToast = "Verified";
      NavigationService().navigateToScreen(ProfessionalDetailsPage());
    }else{
      showToast = " Not Matched";
    }
  }*/

  Future verifyOtpApi(String phNumber, BuildContext context) async {
    final prefs = dependency<PreferenceRepo>();
    final otpVerifyApiRepo = dependency<ApiRepository>();
    var result = await otpVerifyApiRepo.otpverify(otpController.text, phNumber);
    /* var request = http.MultipartRequest('POST', Uri.parse('https://www.v-xplore.com/dev/rohan/e-prescription/verify-otp'));
    request.fields.addAll({
      'otp': otpController.text,
      'number': phNumber
    });


    http.StreamedResponse response = await request.send();*/

    var rr = "";
    if (result.statusCode == 200) {
      rr = await result.stream.bytesToString();
      print(rr);
      var resp = OtpResponseData.fromJson(rr);
      if (resp.data.isMatched == true) {
        prefs.setUserId(resp.data.userId);
        const snackdemo = SnackBar(
          content: Text('Otp Verified'),
          backgroundColor: Colors.green,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
        if(globalVariables.isOtpFromForgotPassword == true){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainDashboardPage()),
          );
        }else{
          NavigationService().navigateToScreen(ProfessionalDetailsPage());
        }

      } else {
        const snackdemo = SnackBar(
          content: Text('Please Give Correct OTP'),
          backgroundColor: Colors.red,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      }

      return resp;
    } else {
      return null;
    }
  }
}
