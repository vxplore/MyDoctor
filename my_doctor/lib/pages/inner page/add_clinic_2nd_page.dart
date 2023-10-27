import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/pages/inner%20page/add_clinic_1st_page.dart';

import '../../service/navigation_service.dart';
import 'add_clinic_3rd_page.dart';

class AddClinicSecondPage extends StatefulWidget {
  final String clinicName;
  const AddClinicSecondPage({super.key, required this.clinicName});

  @override
  State<AddClinicSecondPage> createState() => _AddClinicSecondPageState();
}

class _AddClinicSecondPageState extends State<AddClinicSecondPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red,
        body: SingleChildScrollView(
          // padding: EdgeInsets.only(left: 28,right: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 230,
                width: 1.sw,
                color: Colors.red,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      width: 1.sw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              NavigationService()
                                  .navigateToScreen(AddClinicFirstPage());
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),

                      width: 1.sw,
                      // color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.clinicName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "The contact details for\nthe clinic are ?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                height: 800,
                width: 1.sw,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                      child:
                      Row(
                        children: [
                          Text(
                            "Address",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Color(0xffC7C7C7)),
                          ),

                          Text(
                            "*",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: TextFormField(
                        maxLines: null,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                      child:
                      Row(
                        children: [
                          Text(
                            "City",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Color(0xffC7C7C7)),
                          ),

                          Text(
                            "*",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                      child:
                      Row(
                        children: [
                          Text(
                            "State",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Color(0xffC7C7C7)),
                          ),

                          Text(
                            "*",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                      child:
                      Row(
                        children: [
                          Text(
                            "Pincode",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Color(0xffC7C7C7)),
                          ),

                          Text(
                            "*",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                      child:
                      Row(
                        children: [
                          Text(
                            "Contact Number",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Color(0xffC7C7C7)),
                          ),

                          Text(
                            "*",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    // Spacer(),
                   /* InkWell(onTap: (){
                      NavigationService()
                          .navigateToScreen(AddClinicThirdPage());
                    },
                      child: Container(
                        height: 55,
                        width: 1.sw,
                        // color: Colors.deepPurple,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff1468B3),
                              Colors.greenAccent
                            ], // Adjust the colors as needed
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Align(alignment: Alignment.center,
                          child: Text(
                            "PROCEED",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
              Container(height: 100,
                width: 1.sw,

                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(onTap: (){
                    NavigationService()
                        .navigateToScreen(AddClinicThirdPage());
                  },
                    child: Container(

                      width: 1.sw,
                      // color: Colors.deepPurple,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff1468B3),
                            Colors.greenAccent
                          ], // Adjust the colors as needed
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Align(alignment: Alignment.center,
                        child: Text(
                          "PROCEED",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
