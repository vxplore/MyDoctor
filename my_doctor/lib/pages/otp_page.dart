import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/pages/professionalDetails_page.dart';
import 'package:my_doctor/view_models/otp_view_model.dart';
import 'package:pinput/pinput.dart';

import '../custom widget/button.dart';

class OtpPage extends StatefulWidget {
 final String phnumber;

  OtpPage(String this.phnumber, {super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final vm = OtpViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF3FBFF),
        body: Padding(
          padding: const EdgeInsets.only(left: 21, right: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    height: 112,
                    width: 110,
                    child: Image.asset("assets/images/instadoclogo.png")),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "OTP Verification",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Please check OTP sent to your Email address.",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Color(0xffBBBBBB)),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(0),
                child: TextField(
                  enabled: false,
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(
                        Icons.edit,
                        color: Color(0xffE5E5E5),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xffE5E5E5),
                        size: 40,
                      ),
                      border: InputBorder.none,
                      labelText: widget.phnumber,
                      labelStyle:
                          TextStyle(color: Color(0xffCFCFCF), fontSize: 18)),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(left: 0),
                child: IntrinsicWidth(
                  child: Pinput(
                    controller: vm.otpController,
                    showCursor: true,
                    length: 5,
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsUserConsentApi,
                    defaultPinTheme: PinTheme(
                      width: 70,
                      height: 70,
                      textStyle:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xff707070), width: 0.5),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 70,
                      height: 70,
                      textStyle: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade100),
                    ),
                    /* onCompleted:
                    // ref.watch(enterOTPProvider.notifier).enterotp,
                    onChanged:*/
                    // ref.watch(enterOTPProvider.notifier).enterotp,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Haven't received OTP?",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffCFCFCF)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Resend Now",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1468B3),
                    ),
                  )
                ],
              ),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Container(
                    height: 70,
                    width: 500,
                    child: ourButton(
                        onPress:() {
                          vm.onVerifyNowButtonClicked(widget.phnumber, context);
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfessionalDetailsPage()),
                          );*/
                        },
                        color: Color(0xff1468B3),
                        title: "Verify Now",
                        textColor: Colors.white)),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 2, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "I agree with all the",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffCFCFCF)),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "terms and conditions",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1468B3),
                          decoration: TextDecoration.underline),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "of eprescribe.in",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffCFCFCF),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
