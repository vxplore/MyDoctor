import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllergiesPage extends StatefulWidget {
  const AllergiesPage({super.key});

  @override
  State<AllergiesPage> createState() => _AllergiesPageState();
}

class _AllergiesPageState extends State<AllergiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
       padding: EdgeInsets.only(left: 20, right: 12),
       child: Column(
         children: [
           Container(
             width: 1.sw,
             height: 150,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(height: 20,),
                 Text(
                   "Environmental",
                   style: TextStyle(
                       fontSize: 25,
                       fontWeight: FontWeight.normal,
                       color: Color(0xffC7C7C7)),
                 ),
                 SizedBox(height: 10,),
                 Text(
                   "Patient has any Environmental based allergy?",
                   style: TextStyle(
                       fontSize: 15,
                       fontWeight: FontWeight.normal,
                       color: Color(0xffC7C7C7)),
                 ),
                 SizedBox(height: 10,),
                 Text(
                   "+ Add an Allergen",
                   style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                       color: Color(0xff1468B3),
                     decoration: TextDecoration.underline, ),
                 ),
                 Divider(color: Colors.grey.shade300, thickness: 3),

               ],
             ),
           ),
           Container(
             width: 1.sw,
             height: 150,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(height: 10,),
                 Text(
                   "Food",
                   style: TextStyle(
                       fontSize: 25,
                       fontWeight: FontWeight.normal,
                       color: Color(0xffC7C7C7)),
                 ),
                 SizedBox(height: 10,),
                 Text(
                   "Patient has any Food based allergy?",
                   style: TextStyle(
                       fontSize: 15,
                       fontWeight: FontWeight.normal,
                       color: Color(0xffC7C7C7)),
                 ),
                 SizedBox(height: 10,),
                 Text(
                   "+ Add an Allergen",
                   style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                     color: Color(0xff1468B3),
                     decoration: TextDecoration.underline, ),
                 ),
                 Divider(color: Colors.grey.shade300, thickness: 3),

               ],
             ),
           ),
           Container(
             width: 1.sw,
             height: 150,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(height: 10,),
                 Text(
                   "Drugs",
                   style: TextStyle(
                       fontSize: 25,
                       fontWeight: FontWeight.normal,
                       color: Color(0xffC7C7C7)),
                 ),
                 SizedBox(height: 10,),
                 Text(
                   "Patient has any Drugs based allergy?",
                   style: TextStyle(
                       fontSize: 15,
                       fontWeight: FontWeight.normal,
                       color: Color(0xffC7C7C7)),
                 ),
                 SizedBox(height: 10,),
                 Text(
                   "+ Add an Allergen",
                   style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                     color: Color(0xff1468B3),
                     decoration: TextDecoration.underline, ),
                 ),
                 Divider(color: Colors.grey.shade300, thickness: 3),

               ],
             ),
           ),
           Container(
             width: 1.sw,
             height: 150,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(height: 10,),
                 Text(
                   "Other",
                   style: TextStyle(
                       fontSize: 25,
                       fontWeight: FontWeight.normal,
                       color: Color(0xffC7C7C7)),
                 ),
                 SizedBox(height: 10,),
                 Text(
                   "Patient has any Other based allergy?",
                   style: TextStyle(
                       fontSize: 15,
                       fontWeight: FontWeight.normal,
                       color: Color(0xffC7C7C7)),
                 ),
                 SizedBox(height: 10,),
                 Text(
                   "+ Add an Allergen",
                   style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                     color: Color(0xff1468B3),
                     decoration: TextDecoration.underline, ),
                 ),
                 Divider(color: Colors.grey.shade300, thickness: 3),

               ],
             ),
           ),
         ],
       ),
     ),

    );
  }
}
