import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom widget/showPatientLookUpDialog.dart';

class PatientLookUppage extends StatefulWidget {
  const PatientLookUppage({super.key});

  @override
  State<PatientLookUppage> createState() => _PatientLookUppageState();
}

class _PatientLookUppageState extends State<PatientLookUppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffB8B8B8),
      appBar: AppBar(
        backgroundColor: Color(0xff1468B3),
        toolbarHeight: 90,
        leadingWidth: 30,
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
          size: 35,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Rx",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Color(0xffDCDCDC)),
            ),
            Text(
              "Nitish Kumar",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon( Icons.save,color: Colors.white,size: 30, ),
                SizedBox(width: 5,),
                Icon( Icons.print,color: Colors.white,size: 30, ),
                SizedBox(width: 5,),
                InkWell(onTap: (){
                  showDialog(
                      context: context,
                      builder: (context) => ShowPatientLookUpDialog(),
                      barrierDismissible: false);
                },child: Icon( Icons.list_alt,color: Colors.white,size: 30, )),
                SizedBox(width: 5,),
                Icon( Icons.more_vert,color: Colors.white,size: 30, ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
