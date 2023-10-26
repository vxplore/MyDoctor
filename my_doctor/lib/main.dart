import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/pages/splash_page.dart';
import 'package:my_doctor/service/navigation_service.dart';
import 'core/di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: false,
      designSize: const Size(412, 778),
      // scaleByHeight: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) => MaterialApp(
        navigatorKey: NavigationService().navigationKey,
        debugShowCheckedModeBanner: false,
        title: 'My Doctor',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashPage(),
      ),
    );
  }
}


