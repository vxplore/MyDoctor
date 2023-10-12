import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_doctor/core/repository/api_repo.dart';
import 'package:my_doctor/service/global_variables.dart';
import '../core/di/di.dart';
import '../core/repository/preference_repo.dart';
import '../core/repository/repository.dart';
import '../core/utilites/otp_response_data.dart';
import '../pages/main_dashboard_page.dart';
import '../pages/professionalDetails_page.dart';
import '../service/navigation_service.dart';
import 'package:http/http.dart' as http;

part 'otp_view_model.g.dart';

class OtpViewModel = _OtpViewModel with _$OtpViewModel;

abstract class _OtpViewModel with Store {
  TextEditingController otpController = TextEditingController();

  bool isOtpFieldFilled() {
    if (otpController.text.isNotEmpty) {
      print(otpController.text);
      return true;
    } else {
      return false;
    }
  }

  Future verifyOtp(String phNumber, BuildContext context) async {
    final prefs = dependency<PreferenceRepo>();
    final repo = dependency<Repository>();

    var response = await repo.otpverify(otpController.text, phNumber);

    if (response == null) {
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
        if (globalVariables.isOtpFromForgotPassword == true) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainDashboardPage()),
          );
        } else {
          NavigationService().navigateToScreen(ProfessionalDetailsPage());
        }
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

  onVerifyNowButtonClicked(String phNumber, BuildContext context) {
    verifyOtp(phNumber, context);
  }
}
