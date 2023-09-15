import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorProfessionalEditPage extends StatefulWidget {
  const DoctorProfessionalEditPage({super.key});

  @override
  State<DoctorProfessionalEditPage> createState() => _DoctorProfessionalEditPageState();
}

class _DoctorProfessionalEditPageState extends State<DoctorProfessionalEditPage> {
  String? dropdownvalue1;
  String? dropdownvalue2;
  var items = ['Years', 'Months', "Days"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 12),
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text("Primary Specialization",style: TextStyle(color: Color(0xffC7C7C7),fontSize: 20)),
                Text("*",style: TextStyle(color: Colors.red,fontSize: 20)),
              ],
            ),
            Container(
              height: 60,
              width: 1.sw,
              // margin: EdgeInsets.only(top: 32),
              child: DropdownButton(
                hint: Text("Select"),
                iconSize: 40,
                isExpanded: true,
                style: TextStyle(fontSize: 20, color: Colors.black),
                // Initial Value
                value: dropdownvalue1,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue1 = newValue!;
                  });
                  print(dropdownvalue1);
                },
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text("Specialization to Display",style: TextStyle(color:Color(0xffC7C7C7),fontSize: 20)),
            Container(
              height: 60,
              width: 1.sw,
              // margin: EdgeInsets.only(top: 32),
              child: DropdownButton(
                hint: Text("Select"),
                iconSize: 40,
                isExpanded: true,
                style: TextStyle(fontSize: 20, color: Colors.black),
                // Initial Value
                value: dropdownvalue2,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue2 = newValue!;
                  });
                  print(dropdownvalue2);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Qualification",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Color(0xffC7C7C7)),
            ),
            Container(
              height: 70,
              width: 1.sw,
              child: const Padding(
                padding: EdgeInsets.all(0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Registration Number",
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
                      color:Colors.red,
                ),),
              ],
            ),
            Container(
              height: 70,
              width: 1.sw,
              child: const Padding(
                padding: EdgeInsets.all(0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "State Medical Council",
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
                    color:Colors.red,
                  ),),
              ],
            ),
            Container(
              height: 70,
              width: 1.sw,
              child: const Padding(
                padding: EdgeInsets.all(0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(),
                ),
              ),
            ),

            /////////////////////////////////////////////
          ],
        ),
      ),
    );
  }
}
