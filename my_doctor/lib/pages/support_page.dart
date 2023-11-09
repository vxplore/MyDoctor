import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff1468B3),
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            /* Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PatientPrescriptionPage(
                      globalVariables.patientName!,
                      globalVariables.patientAge!,
                      globalVariables.patientAgeType!,
                      globalVariables.patientsGender!,
                      globalVariables.patientImg!)),
            );*/
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 35,
          ),
        ),
        title: Text(
          "Support",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {
                final Uri url = Uri(scheme: "tel", path: "18888888818");
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  print("cannot start calling");
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/phone.png",
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contact Number",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                        Text(
                          "18888888818",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                final Uri whatsapp = Uri.parse("https://wa.me/18888888818");
                launchUrl(whatsapp);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/whatsapp.png",
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "WhatsApp Number",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                        Text(
                          "18888888818",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                String email = Uri.encodeComponent("myDoc@gmail.com");
                /* String subject = Uri.encodeComponent("Hello Flutter");
                      String body = Uri.encodeComponent("Hi! I'm Flutter Developer");
                      print(subject); //output: Hello%20Flutter
                       Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");*/
                Uri mail = Uri.parse("mailto:$email");
                if (await launchUrl(mail)) {
                  //email app opened
                } else {
                  //email app is not opened
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/email_2_icon.png",
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                        Text(
                          "myDoc@gmail.com",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
