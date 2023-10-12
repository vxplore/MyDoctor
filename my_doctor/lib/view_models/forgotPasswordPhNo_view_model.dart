import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_doctor/core/di/di.dart';
import 'package:my_doctor/core/repository/api_repo.dart';
import 'package:my_doctor/pages/otp_page.dart';
import 'package:my_doctor/service/global_variables.dart';

import '../core/utilites/verifyMobileNo_response_data.dart';
import '../service/navigation_service.dart';
part 'forgotPasswordPhNo_view_model.g.dart';
class ForgotPasswordPhNumberViewModel = _ForgotPasswordPhNumberViewModel with _$ForgotPasswordPhNumberViewModel;

abstract class _ForgotPasswordPhNumberViewModel with Store {
  @observable
  TextEditingController emailController = TextEditingController();

 Future<VerifymobilenoResponseData?> verifyMobilenumberApi(BuildContext context)async{

  final verifyMobileNoApiRepo = dependency<ApiRepository>();
var result = await verifyMobileNoApiRepo.verifymobileno(emailController.text);
  var rr = "";
  if (result.statusCode == 200) {
    rr = await result.stream.bytesToString();
    print(rr);
    var resp = VerifymobilenoResponseData.fromJson(rr);
    if (resp.isVerified == true) {
      globalVariables.isOtpFromForgotPassword = true;
      var snackdemo = SnackBar(
        content: Text('Please verify with this OTP : ${resp.otp}'),
        backgroundColor: Colors.green,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      NavigationService().navigateToScreen(OtpPage(emailController.text));
    } else {
      var snackdemo = SnackBar(
        content: Text('${resp.message}'),
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