import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../view_models/intro_view_model.dart';
import '../view_models/splash_view_model.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}
class _IntroPageState extends State<IntroPage> with WidgetsBindingObserver {

  final vm = IntroViewModel();
  List<ReactionDisposer> _disposers = [];
  IntroImage() {
    return Image.asset("assets/introimage.png");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3FBFF),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IntroImage(),
              Container(
                height: 49,
              ),
              Padding(
                padding: const EdgeInsets.only(left:36,right: 36),
                child: Column(
                  children: [
                    Text.rich(
                        TextSpan(
                            text: 'Welcome to ',
                            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Color(0xff41CFD9)),
                            children: <InlineSpan>[
                              TextSpan(
                                text: 'ePRESCRIBE',
                                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color(0xffff0000)),
                              )
                            ]
                        )
                    ),
                    Container(
                      height: 8,
                    ),
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac vestibulum mi.",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xffB7B7B7)
                        ),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      height: 49,
                    ),
                    Container(
                      width: double.infinity,
                      height: 62,
                      child: ElevatedButton(
                          onPressed: (){},
                          child: Text(
                              "Get Started",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff1468B3),
                          foregroundColor: Colors.white// Background color
                        )
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
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
}
