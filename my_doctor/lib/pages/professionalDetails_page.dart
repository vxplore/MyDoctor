import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_doctor/pages/congratulations_page.dart';
import 'package:my_doctor/view_models/professionalDetails_view_model.dart';
import 'package:pinput/pinput.dart';

import '../core/utilites/speciality_dropdown_data.dart';
import '../custom widget/button.dart';
import '../service/global_variables.dart';

class ProfessionalDetailsPage extends StatefulWidget {
  const ProfessionalDetailsPage({super.key});

  @override
  State<ProfessionalDetailsPage> createState() =>
      _ProfessionalDetailsPageState();
}

class _ProfessionalDetailsPageState extends State<ProfessionalDetailsPage> {
  // SpecialityDropdownData? res;
  /*@override
  void initState(){
    super.initState();
     vm.getSpecialitydropdowndataApi();

  }*/
  final ImagePicker picker = ImagePicker();

  Future fontgetImage(ImageSource media) async {
    var fontimg = await picker.pickImage(source: media);
    setState(() {
      globalVariables.fontimage = fontimg;
    });
  }

  Future backgetImage(ImageSource media) async {
    var backimg = await picker.pickImage(source: media);
    setState(() {
      globalVariables.backimage = backimg;
    });
  }

  void fontPic() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      fontgetImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      fontgetImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void backPic() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      backgetImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      backgetImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  String? bloodGroupValue;
  var bloodgroups = [
    "A RhD positive (A+)",
    "A RhD negative (A-)",
    "B RhD positive (B+)",
    "B RhD negative (B-)",
    "O RhD positive (O+)",
    "O RhD negative (O-)",
    "AB RhD positive (AB+)",
    "AB RhD negative (AB-)"
  ];

 /* List<String> myList = []; // Create an empty list
  listadd(){
    myList.add(res?.data.specializations.forEach((element) {
      element.name;
    }));
  }*/
  final vm = ProfessionalDetailsViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF3FBFF),
        body: Padding(
          padding: const EdgeInsets.only(left: 29, right: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    height: 112,
                    width: 110,
                    child: Image.asset("assets/images/instadoclogo.png")),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Your Professional detail",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter your professional Details",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Color(0xffBBBBBB)),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 350,
                width: 500,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 500,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 25),
                                child: Image.asset(
                                    "assets/images/registration_icon.png")),
                            const SizedBox(width: 5),
                            Container(
                              height: 70,
                              width: 300,
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: TextField(
                                  controller: vm.registrationNumberController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Registration Number',
                                    labelStyle: TextStyle(
                                        fontSize: 25, color: Color(0xffC7C7C7)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 70,
                        width: 500,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 25),
                                child: Image.asset(
                                    "assets/images/medicalCouncil_icon.png")),
                            const SizedBox(width: 5),
                            Container(
                              height: 70,
                              width: 300,
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: TextField(
                                  controller: vm.stateMedicalCouncilController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'State Medical Council',
                                    labelStyle: TextStyle(
                                        fontSize: 25, color: Color(0xffC7C7C7)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 70,
                        width: 500,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 25),
                                child: Image.asset(
                                    "assets/images/speciallity_icon.png")),
                            const SizedBox(width: 5),
                            /* Container(
                              height: 70,
                              width: 300,
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: TextField(
                                  controller: vm.specialityController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Speciality',
                                    labelStyle: TextStyle(
                                        fontSize: 25, color: Color(0xffC7C7C7)),
                                  ),
                                ),
                              ),
                            ),*/
                            Container(
                              height: 80,
                              width: 300,
                              margin: EdgeInsets.only(top: 22),
                              child: DropdownButton(
                                hint: Text("Select Speciality"),
                                iconSize: 40,
                                isExpanded: true,
                                style: TextStyle(
                                    fontSize: 25, color: Color(0xffC7C7C7)),
                                // Initial Value
                                value: bloodGroupValue,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: globalVariables.specialityName.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    bloodGroupValue = newValue!;
                                  });
                                  print(bloodGroupValue);
                                  // print(res?.data.specializations[index].name);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 70,
                        width: 500,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 25),
                                child: Image.asset(
                                    "assets/images/experience_icon.png")),
                            const SizedBox(width: 5),
                            Container(
                              height: 70,
                              width: 300,
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: TextField(
                                  controller: vm.yearsOfExperienceController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Year of Experience',
                                    labelStyle: TextStyle(
                                        fontSize: 25, color: Color(0xffC7C7C7)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Your KYC",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffCFCFCF)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "(Aadhar Card)",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffCFCFCF)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 75,
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        fontPic();
                      },
                      child: Container(
                        height: 75,
                        width: 165,
                        color: Colors.white,
                        child: Align(
                          alignment: Alignment.center,
                          child: globalVariables.fontimage == null
                              ? Text(
                                  "Font",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xffCFCFCF)),
                                )
                              : ClipRRect(
                                  // borderRadius: BorderRadius.circular(100),
                                  child: Image.file(
                                    File(globalVariables.fontimage!.path),
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                    height: 300,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        backPic();
                      },
                      child: Container(
                        height: 75,
                        width: 165,
                        color: Colors.white,
                        child: Align(
                          alignment: Alignment.center,
                          child: globalVariables.backimage == null
                              ? Text(
                                  "Back",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xffCFCFCF)),
                                )
                              : ClipRRect(
                                  // borderRadius: BorderRadius.circular(100),
                                  child: Image.file(
                                    File(globalVariables.backimage!.path),
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                    height: 300,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    height: 70,
                    width: 500,
                    child: ourButton(
                        onPress: vm.isAllFieldComplete() == true
                            ? () {
                                print(
                                    "${File(globalVariables.fontimage!.path)}");
                                print(
                                    "${File(globalVariables.backimage!.path)}");
                                vm.onNextPageClicked();
                                /*Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CongratulationsPage()),
                          );*/
                              }
                            : null,
                        color: Color(0xff1468B3),
                        title: "Next Step",
                        textColor: Colors.white)),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 4, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "I agree with all the",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffCFCFCF)),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    InkWell(onTap: (){
                      vm.getSpecialitydropdowndataApi();
                    },
                      child: Text(
                        "terms and conditions",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1468B3),
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "of eprescribe.in",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffCFCFCF),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
