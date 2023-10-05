import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/view_models/forgotPasswordPhNo_view_model.dart';

class ForgotPasswordPhNoPage extends StatefulWidget {
  const ForgotPasswordPhNoPage({super.key});

  @override
  State<ForgotPasswordPhNoPage> createState() => _ForgotPasswordPhNoPageState();
}

class _ForgotPasswordPhNoPageState extends State<ForgotPasswordPhNoPage> {
  final vm = ForgotPasswordPhNumberViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF3FBFF),
        body: Padding(
          padding: const EdgeInsets.all(21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
              ),
              Text(
                "Enter Your Phone number",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                height: 30,
              ),
              MyTextField(vm.emailController, "Phone Number",
                  "assets/images/mobile_icon.png"),
              Container(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    vm.verifyMobilenumberApi(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff1468B3),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4))),
                  child: const Text("Verify Your Phone number"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget MyTextField(
      TextEditingController controller, String hint, String image,
      {bool obscureText = false}) {
    return SizedBox(
        height: 55,
        child: TextField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child:
                    SizedBox(width: 26, height: 22, child: Image.asset(image)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xffD8D8D8)),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xff1468B3))),
              hintText: hint,
              hintStyle: const TextStyle(color: Color(0xffCFCFCF))),
          style: const TextStyle(color: Color(0xff1468B3)),
        ));
  }
}
