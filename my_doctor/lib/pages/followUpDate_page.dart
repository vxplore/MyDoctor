import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class FollowUpDatePage extends StatefulWidget {
  const FollowUpDatePage({super.key});

  @override
  State<FollowUpDatePage> createState() => _FollowUpDatePageState();
}

class _FollowUpDatePageState extends State<FollowUpDatePage> {
  String? formattedDate;
  DateTime? selectedDate;
  String? selectedDateFromCalender;
  bool isDateSelectFromCalender = false;
  bool isDateSelectedFromOption = false;
  String selectedFollowUpDate = "";
  bool isSosClicked = false;
  bool isWithReportClicked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                height: 150,
                width: 1.sw,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "SET FOLLOW UP DATE",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "After how many days patient should visit\nagain ?",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.shade400,
                thickness: 2,
              ),
              Container(
                height: 85,
                width: 1.sw,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Text(
                        (formattedDate == null &&
                                selectedDateFromCalender == null)
                            ? "Select Custom Date"
                            : (isDateSelectedFromOption == true)
                                ? "${formattedDate}"
                                : "${selectedDateFromCalender}",
                        style: TextStyle(
                            color: (formattedDate == null &&
                                    selectedDateFromCalender == null)
                                ? Colors.black
                                : Colors.deepOrange,
                            fontSize: 20),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () async {
                          selectedDate = await showDatePicker(
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              context: (context));
                          setState(() {
                            selectedDateFromCalender = formattedDate =
                                DateFormat("dd-MM-yyyy").format(selectedDate!);
                            isDateSelectFromCalender = true;
                            isDateSelectedFromOption = false;
                          });
                          print(selectedDateFromCalender);
                        },
                        child: Icon(
                          Icons.calendar_today,
                          color: Colors.deepOrange,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.grey.shade400,
                thickness: 2,
              ),
              Container(
                margin: EdgeInsets.all(12),
                height: 380,
                width: 1.sw,
                color: Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            formattedDate = DateFormat("dd-MM-yyyy")
                                .format(DateTime.now().add(Duration(days: 1)));
                            isDateSelectFromCalender = false;
                            isDateSelectedFromOption = true;
                          });
                          print(formattedDate);
                        },
                        child: Container(
                          height: 55,
                          width: 1.sw,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "1 Day",
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 2,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            formattedDate = DateFormat("dd-MM-yyyy")
                                .format(DateTime.now().add(Duration(days: 2)));
                            isDateSelectFromCalender = false;
                            isDateSelectedFromOption = true;
                          });
                          print(formattedDate);
                        },
                        child: Container(
                          height: 55,
                          width: 1.sw,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "2 Days",
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 2,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            formattedDate = DateFormat("dd-MM-yyyy")
                                .format(DateTime.now().add(Duration(days: 3)));
                            isDateSelectFromCalender = false;
                            isDateSelectedFromOption = true;
                          });
                          print(formattedDate);
                        },
                        child: Container(
                          height: 55,
                          width: 1.sw,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "3 Days",
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 2,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            formattedDate = DateFormat("dd-MM-yyyy")
                                .format(DateTime.now().add(Duration(days: 4)));
                            isDateSelectFromCalender = false;
                            isDateSelectedFromOption = true;
                          });
                          print(formattedDate);
                        },
                        child: Container(
                          height: 55,
                          width: 1.sw,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "4 Days",
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 2,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            formattedDate = DateFormat("dd-MM-yyyy")
                                .format(DateTime.now().add(Duration(days: 5)));
                            isDateSelectFromCalender = false;
                            isDateSelectedFromOption = true;
                          });
                          print(formattedDate);
                        },
                        child: Container(
                          height: 55,
                          width: 1.sw,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "5 Days",
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 2,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            formattedDate = DateFormat("dd-MM-yyyy")
                                .format(DateTime.now().add(Duration(days: 6)));
                            isDateSelectFromCalender = false;
                            isDateSelectedFromOption = true;
                          });
                          print(formattedDate);
                        },
                        child: Container(
                          height: 55,
                          width: 1.sw,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "6 Days",
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 2,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            formattedDate = DateFormat("dd-MM-yyyy")
                                .format(DateTime.now().add(Duration(days: 7)));
                            isDateSelectFromCalender = false;
                            isDateSelectedFromOption = true;
                          });
                          print(formattedDate);
                        },
                        child: Container(
                          height: 55,
                          width: 1.sw,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "1 Week",
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 2,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            formattedDate = DateFormat("dd-MM-yyyy")
                                .format(DateTime.now().add(Duration(days: 14)));
                            isDateSelectFromCalender = false;
                            isDateSelectedFromOption = true;
                          });
                          print(formattedDate);
                        },
                        child: Container(
                          height: 55,
                          width: 1.sw,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "2 Weeks",
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 2,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            formattedDate = DateFormat("dd-MM-yyyy")
                                .format(DateTime.now().add(Duration(days: 21)));
                            isDateSelectFromCalender = false;
                            isDateSelectedFromOption = true;
                          });
                          print(formattedDate);
                        },
                        child: Container(
                          height: 55,
                          width: 1.sw,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "3 Weeks",
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 2,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            formattedDate = DateFormat("dd-MM-yyyy")
                                .format(DateTime.now().add(Duration(days: 30)));
                            isDateSelectFromCalender = false;
                            isDateSelectedFromOption = true;
                          });
                          print(formattedDate);
                        },
                        child: Container(
                          height: 55,
                          width: 1.sw,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "1 Month",
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 2,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            formattedDate = DateFormat("dd-MM-yyyy")
                                .format(DateTime.now().add(Duration(days: 60)));
                            isDateSelectFromCalender = false;
                            isDateSelectedFromOption = true;
                          });
                          print(formattedDate);
                        },
                        child: Container(
                          height: 55,
                          width: 1.sw,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "2 Months",
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 2,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            formattedDate = DateFormat("dd-MM-yyyy")
                                .format(DateTime.now().add(Duration(days: 90)));
                            isDateSelectFromCalender = false;
                            isDateSelectedFromOption = true;
                          });
                          print(formattedDate);
                        },
                        child: Container(
                          height: 55,
                          width: 1.sw,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "3 Months",
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 2,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            formattedDate = DateFormat("dd-MM-yyyy").format(
                                DateTime.now().add(Duration(days: 120)));
                            isDateSelectFromCalender = false;
                            isDateSelectedFromOption = true;
                          });
                          print(formattedDate);
                        },
                        child: Container(
                          height: 55,
                          width: 1.sw,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "4 Months",
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 2,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            formattedDate = DateFormat("dd-MM-yyyy").format(
                                DateTime.now().add(Duration(days: 150)));
                            isDateSelectFromCalender = false;
                            isDateSelectedFromOption = true;
                          });
                          print(formattedDate);
                        },
                        child: Container(
                          height: 55,
                          width: 1.sw,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "5 Months",
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 2,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            formattedDate = DateFormat("dd-MM-yyyy").format(
                                DateTime.now().add(Duration(days: 180)));
                            isDateSelectFromCalender = false;
                            isDateSelectedFromOption = true;
                          });
                          print(formattedDate);
                        },
                        child: Container(
                          height: 55,
                          width: 1.sw,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "6 Months",
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 2,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            formattedDate = DateFormat("dd-MM-yyyy").format(
                                DateTime.now().add(Duration(days: 365)));
                            isDateSelectFromCalender = false;
                            isDateSelectedFromOption = true;
                          });
                          print(formattedDate);
                        },
                        child: Container(
                          height: 55,
                          width: 1.sw,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "1 Year",
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 2,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "Patient to follow up",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 12.0, right: 12),
                height: 50,
                width: 1.sw,
                child: Row(
                  children: [
                    Checkbox(
                      value: this.isSosClicked,
                      onChanged: (bool? value) {
                        setState(() {
                          this.isSosClicked = value!;
                        });
                        print("SOS CLICKED : ${this.isSosClicked}");
                      },
                    ),
                    Text(
                      "For SOS",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Checkbox(
                      value: this.isWithReportClicked,
                      onChanged: (bool? value) {
                        setState(() {
                          this.isWithReportClicked = value!;
                        });
                        print(
                            "WITH REPORTS CLICKED : ${this.isWithReportClicked}");
                      },
                    ),
                    Text(
                      "With Reports",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    selectedFollowUpDate = getSelectDate();
                    print("from function: ${selectedFollowUpDate}");
                  },
                  child: Container(
                    height: 65,
                    width: 1.sw,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.deepOrange.shade400, Colors.orange],
                        ),
                        // color: Colors.lightGreenAccent.shade400,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Done",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
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

  String getSelectDate() {
    if (formattedDate == null && selectedDateFromCalender == null) {
      return "Select Custom Date";
    } else if (isDateSelectedFromOption == true) {
      return "${formattedDate}";
    } else {
      return "${selectedDateFromCalender}";
    }
  }
}
