import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:my_doctor/pages/intro_page.dart';
import 'package:my_doctor/pages/login_page.dart';
import 'package:my_doctor/service/navigation_service.dart';

import '../view_models/splash_view_model.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}
SplashLogo() {
  return Image.asset("assets/images/instadoclogo.png");
}
class _SplashPageState extends State<SplashPage> with WidgetsBindingObserver {

  final vm = SplashViewModel();
  List<ReactionDisposer> _disposers = [];

  @override
  Widget build(BuildContext context) {

     /* Timer.periodic(Duration(seconds: 3), (timer) {
        NavigationService().navigateToScreen(LoginPage());
      })*/

    return Scaffold(
      backgroundColor: Color(0xffF3FBFF),
      body: SafeArea(
        child: splashWidget(),
      ),
    );
  }

  Widget splashWidget(){
    return Stack(
      children: [
        Center(child: LogoName()),
        Align(
          alignment: Alignment.bottomCenter,
            child: CopyRight()
        ),
        Padding(
          padding: const EdgeInsets.all(70.0),
          child: Align(
            alignment: Alignment.bottomCenter,
              child: CircularIndicator()
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();

  Timer.periodic(Duration(seconds: 3), (timer) {
       vm.screenSwitch();
        timer.cancel();
       /* if (timer.tick == 2)
        {
          print(timer.tick);
          timer.cancel();


// some code here once timed out

        }*/
      });
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


}

CircularIndicator() {
  return CircularProgressIndicator(
    backgroundColor: Color(0xffFF3E49),
    valueColor: AlwaysStoppedAnimation(Color(0xff41CFD9)),
    strokeWidth: 4,
  );
}
Widget CopyRight() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text("Instadoc.in © 2022. All Rights Reserved."),
  );
}
Widget LogoName() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SplashLogo(),
      Text.rich(
          TextSpan(
              text: 'e',
              style: TextStyle(fontSize: 31,fontWeight: FontWeight.bold, color: Color(0xff41CFD9)),
              children: <InlineSpan>[
                TextSpan(
                  text: 'PRESCRIPTION',
                  style: TextStyle(fontSize: 31,fontWeight: FontWeight.bold,color: Color(0xffff0000)),
                )
              ]
          )
      )
    ],
  );
}

///////////////////////////

class ProgressIndicatorExample extends StatefulWidget {
  const ProgressIndicatorExample({super.key});

  @override
  State<ProgressIndicatorExample> createState() =>
      _ProgressIndicatorExampleState();
}

class _ProgressIndicatorExampleState extends State<ProgressIndicatorExample>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: controller.value,
      semanticsLabel: 'Circular progress indicator',
    );
  }
}