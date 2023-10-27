import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/pages/inner%20page/add_clinic_2nd_page.dart';

import '../../service/navigation_service.dart';
import '../doctor_profile_edit_page.dart';

class AddClinicFirstPage extends StatefulWidget {
  const AddClinicFirstPage({super.key});

  @override
  State<AddClinicFirstPage> createState() => _AddClinicFirstPageState();
}

class _AddClinicFirstPageState extends State<AddClinicFirstPage> {
  TextEditingController _controller = TextEditingController();
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
                                  .navigateToScreen(DoctorProfileEditPage(initialTabIndex: 2,));
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
                            "Add Clinic",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "What is the name of your\nclinic / hospital?",
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
                height: 600,
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
                          const EdgeInsets.only(left: 10, top: 50, bottom: 10),
                      child: Row(
                        children: [
                          Text(
                            "Clinic Name",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.normal,
                                color: Color(0xffC7C7C7)),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "*",
                            style: TextStyle(
                              fontSize: 25,
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
                        controller: _controller,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                   Spacer(),
                   InkWell(onTap: (){
                       NavigationService()
                                .navigateToScreen(AddClinicSecondPage(clinicName: _controller.text,));
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
                   ),
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
