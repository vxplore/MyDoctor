import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:my_doctor/view_models/login_view_model.dart';
import '../view_models/intro_view_model.dart';
import '../view_models/splash_view_model.dart';
Logo() {
  return Padding(
    padding: const EdgeInsets.only(top: 40),
    child: Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
          width: 90,
          height: 90,
          child: Image.asset("assets/instadoclogo.png")
      ),
    ),
  );
}
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {

  final vm = LoginViewModel();
  List<ReactionDisposer> _disposers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3FBFF),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(21),
              child: LoginContent(),
            ),
            CopyRight(),
            Logo(),
          ],
        )
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _disposers = [
    ];
  }

  @override
  void dispose() {
    for (var d in _disposers) {
      d();
    }
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

  }

  Widget CopyRight() {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: Text("Instadoc.in © 2022. All Rights Reserved."),
      ),
    );
  }

  Widget LoginContent() {
    return Scaffold(
      backgroundColor: Color(0xffF3FBFF),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.topLeft,
                child: Text(
                  "Let's Sign You In",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                )
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Welcome back, you've been missed",
                style: TextStyle(
                  color: Color(0xffBBBBBB)
                ),
              ),
            ),
            Container(
              height: 31,
            ),
            MyTextField(
              vm.emailController,
              "Email Address",
              "assets/email_icon.png"
            ),
            Container(
              height: 18,
            ),
            MyTextField(
                vm.passwordController,
                "Password",
                "assets/password_icon.png",
                obscureText: true
            ),
            Container(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                  onPressed: (){},
                  child: Text("Sign In"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1468B3),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget MyTextField(
      TextEditingController controller,
      String hint,
      String image,
      {bool obscureText = false}
  ) {
    return SizedBox(
        height: 55,
        child:TextField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: SizedBox(
                    width: 26,
                    height: 22,
                    child: Image.asset(image)
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1,
                    color: Color(0xffD8D8D8)
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
                      color: Color(0xff1468B3)
                  )
              ),
              hintText: hint,
              hintStyle: const TextStyle(
                  color: Color(0xffCFCFCF)
              )
          ),
          style: const TextStyle(
              color: Color(0xff1468B3)
          ),
        )
    );
  }
}
