import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorBankDetailsPage extends StatefulWidget {
  const DoctorBankDetailsPage({super.key});

  @override
  State<DoctorBankDetailsPage> createState() => _DoctorBankDetailsPageState();
}

class _DoctorBankDetailsPageState extends State<DoctorBankDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 200,
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Provide your\nbanking details",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            )
          ],
        ),
        toolbarHeight: 120,
        backgroundColor: Colors.lightGreen,
      ),
    );
  }
}
