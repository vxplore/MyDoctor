import 'package:flutter/material.dart';
import 'package:my_doctor/pages/patient_prescription_page.dart';
import 'package:my_doctor/service/global_variables.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../custom widget/showPatientLookUpDialog.dart';

class PrescriptionWebViewPage extends StatefulWidget {
  const PrescriptionWebViewPage({super.key});

  @override
  State<PrescriptionWebViewPage> createState() =>
      _PrescriptionWebViewPageState();
}

class _PrescriptionWebViewPageState extends State<PrescriptionWebViewPage> {
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
    ..loadRequest(Uri.parse('https://www.google.com/'));

  /*@override
  void initState() {
    // TODO: implement initState
    super.initState();
    showDialog(
        context: context,
        builder: (context) => ShowPatientLookUpDialog(),
        barrierDismissible: false);
  }*/

  Future<void> _launchUrl(String urls) async {
    if (!await launchUrl(Uri.parse(urls))) {
      throw Exception(
          'Could not launch $Uri.parse($urls');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xff1468B3),
        toolbarHeight: 80,
        leadingWidth: 30,
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PatientPrescriptionPage(
                      globalVariables.patientName!,
                      globalVariables.patientAge!,
                      globalVariables.patientAgeType!,
                      globalVariables.patientsGender!,
                      globalVariables.patientImg!)),
            );
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 35,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "INTERACTIVE Rx PREVIEW FOR",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Color(0xffDCDCDC)),
            ),
            Text(
              "${globalVariables.patientName}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 21),
            child: InkWell(
              onTap: () {
                _launchUrl("https://pub.dev/packages/url_launcher");
              },
              child: Icon(
                Icons.print,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        height: 750,
        width: 500,
        child: Column(
          children: [
            Container(
                height: 650,
                width: 500,
                child: WebViewWidget(controller: _controller)),
            Container(
              height: 95,
              width: 500,
              color: Color(0xffFFFFFF),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height: 65,
                      width: 198,
                      color: Colors.grey.shade100,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "SAVE DRAFT",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                    ),
                    Container(
                      height: 65,
                      width: 197,
                      color: Colors.cyanAccent.shade400,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "FINISH",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 75,
        width: 80,
        child: FloatingActionButton(
          shape:
            const StadiumBorder(side: BorderSide(color: Colors.white, width: 2)),
          // isExtended: true,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 50,
          ),
          backgroundColor: Color(0xff1468B3),
          onPressed: () {
            /* Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PatientComplaintsPage()),
            );*/
            showDialog(
                context: context,
                builder: (context) => ShowPatientLookUpDialog(),
                barrierDismissible: false);
          },
        ),
      ),
    );
  }
}
