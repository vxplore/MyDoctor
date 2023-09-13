import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../core/di/di.dart';
import '../core/repository/preference_repo.dart';
import '../core/utilites/otp_response_data.dart';
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

  Future verifyOtpApi(String phNumber, BuildContext context)async{
    final prefs = dependency<PreferenceRepo>();
    var request = http.MultipartRequest('POST', Uri.parse('https://www.v-xplore.com/dev/rohan/e-prescription/verify-otp'));
    request.fields.addAll({
      'otp': otpController.text,
      'number': phNumber
    });


    http.StreamedResponse response = await request.send();

    var rr = "";
    if (response.statusCode == 200) {
      rr = await response.stream.bytesToString();
      print(rr);
      var cccaaaaq = OtpResponseData.fromJson(rr);
      if (cccaaaaq.data.isMatched == true) {
        prefs.setUserId(cccaaaaq.data.userId);
        const snackdemo = SnackBar(
          content: Text('Otp Verified'),
          backgroundColor: Colors.green,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
        NavigationService().navigateToScreen(ProfessionalDetailsPage());
      }else{
        const snackdemo = SnackBar(
          content: Text('Please Give Correct OTP'),
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
