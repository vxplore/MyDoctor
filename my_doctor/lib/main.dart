import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/pages/splash_page.dart';
import 'package:my_doctor/service/navigation_service.dart';
import 'core/di/di.dart';
import 'package:webview_flutter/webview_flutter.dart';

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


/*
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter WebView Example'),
        ),
        body: WebViewExample(),
      ),
    );
  }
}

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  WebViewController _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://www.google.com/search?q=cricket&rlz=1C1UEAD_enIN1062IN1062&oq=cr&gs_lcrp=EgZjaHJvbWUqDwgAEEUYOxiDARixAxiABDIPCAAQRRg7GIMBGLEDGIAEMgYIARBFGDkyDQgCEAAYgwEYsQMYgAQyDQgDEAAYgwEYsQMYgAQyBAgEEAUyBggFEEUYPTIGCAYQRRg8MgYIBxBFGD3SAQc5OThqMGo3qAIAsAIA&sourceid=chrome&ie=UTF-8#sie=m;/g/11kql6bvpt;5;/m/021vk;dt;fp;1;;;'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: 700,
            width: 500,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text("WebView"),
                  ),
                ),
                Container(
                    height: 500,
                    width: 500,
                    child: WebViewWidget(controller: _controller)),
              ],
            )));
  }
}

*/
