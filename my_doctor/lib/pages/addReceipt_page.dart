import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AddReceiptPage extends StatefulWidget {
  const AddReceiptPage({super.key});

  @override
  State<AddReceiptPage> createState() => _AddReceiptPageState();
}

class _AddReceiptPageState extends State<AddReceiptPage> {
  DateTime? seletedYear;
  String? dropdownvalue2;
  int? yearss;
  String? monthss;
  var items = ['Years', 'Months', "Days"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          // padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Add Receipt",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.done,
                        size: 40,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(color: Colors.grey.shade400, thickness: 2),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Invoice No.",
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
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Patient Name",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffC7C7C7)),
                    ),
                    Container(
                      height: 60,
                      width: 1.sw,
                      // margin: EdgeInsets.only(top: 32),
                      child: DropdownButton(
                        hint: Text(
                          "Select Patient From Here",
                          style: TextStyle(color: Colors.grey),
                        ),
                        iconSize: 40,
                        isExpanded: true,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        // Initial Value
                        value: dropdownvalue2,

                        // Down Arrow Icon
                        icon: Icon(
                          Icons.contacts,
                          color: Colors.green,
                        ),

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
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date of Receipt",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffC7C7C7)),
                    ),
                    InkWell(
                      onTap: () async {
                        seletedYear = await showDatePicker(
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                            context: (context));
                        setState(() {
                          monthss = DateFormat.MMM().format(seletedYear!);
                          yearss = seletedYear!.year;
                        });
                        print(seletedYear);
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 345,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  (yearss == null && monthss == null)
                                      ? "Select Date"
                                      : "${seletedYear?.day}-${monthss}-${yearss}",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            /* const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Select Date",
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                            ),*/
                          ),
                          Spacer(),
                          Icon(
                            Icons.calendar_today,
                            size: 40,
                            color: Colors.deepOrange,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Clinic/Hospital",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffC7C7C7)),
                    ),
                    Container(
                      height: 60,
                      width: 1.sw,
                      // margin: EdgeInsets.only(top: 32),
                      child: DropdownButton(
                        hint: Text(
                          "Select Clinic/Hospital",
                          style: TextStyle(color: Colors.grey),
                        ),
                        iconSize: 40,
                        isExpanded: true,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        // Initial Value
                        value: dropdownvalue2,

                        // Down Arrow Icon
                        icon: Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.green,
                        ),

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
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Service Provided",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffC7C7C7)),
                    ),
                    Container(
                      height: 60,
                      width: 1.sw,
                      // margin: EdgeInsets.only(top: 32),
                      child: DropdownButton(
                        hint: Text(
                          "Select Service Provided",
                          style: TextStyle(color: Colors.grey),
                        ),
                        iconSize: 40,
                        isExpanded: true,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        // Initial Value
                        value: dropdownvalue2,

                        // Down Arrow Icon
                        icon: Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.green,
                        ),

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
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Amount",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffC7C7C7)),
                    ),
                    Row(
                      children: [
                        Text(
                          "₹",
                          style: TextStyle(color: Colors.grey, fontSize: 30),
                        ),
                        Container(
                          height: 70,
                          width: 370,
                          child: const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment Method",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffC7C7C7)),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.language,
                          size: 40,
                          color: Colors.blue,
                        ),
                        Spacer(),
                        Container(
                          height: 60,
                          width: 345,
                          // margin: EdgeInsets.only(top: 32),
                          child: DropdownButton(
                            hint: Text(
                              "Select Payment Method",
                              style: TextStyle(color: Colors.grey),
                            ),
                            iconSize: 40,
                            isExpanded: true,
                            style: TextStyle(fontSize: 20, color: Colors.black),
                            // Initial Value
                            value: dropdownvalue2,

                            // Down Arrow Icon
                            icon: Icon(
                              Icons.arrow_drop_down_outlined,
                              color: Colors.green,
                            ),

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
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Remarks:",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffC7C7C7)),
                    ),
                    Container(
                      height: 70,
                      width: 1.sw,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(),
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
