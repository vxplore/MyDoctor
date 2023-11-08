import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/pages/doctor_profile_edit_page.dart';
import 'package:my_doctor/pages/inner%20page/doctor_practice_page.dart';

import '../../custom widget/clinic_schedule_card.dart';
import '../../service/navigation_service.dart';
import 'add_clinic_2nd_page.dart';

class AddClinicThirdPage extends StatefulWidget {
  const AddClinicThirdPage({super.key});

  @override
  State<AddClinicThirdPage> createState() => _AddClinicThirdPageState();
}

class _AddClinicThirdPageState extends State<AddClinicThirdPage> {
  List<String> hours = List.generate(12, (int index) => (index + 1).toString());
  List<String> minutes = ['00', '30'];
  List<String> amPm = ['AM', 'PM'];
  Map<String, List<Map<String, String>>> schedule = {
    'Sunday': [],
    'Monday': [],
    'Tuesday': [],
    "Wednesday": [],
    "Thursday": [],
    "Friday": [],
    "Saturday": []
  };
  Map<String, String?> startHour = {};
  Map<String, String?> startMinute = {};
  Map<String, String?> startAmPm = {};
  Map<String, String?> endHour = {};
  Map<String, String?> endMinute = {};
  Map<String, String?> endAmPm = {};

  @override
  void initState() {
    super.initState();
    for (var day in schedule.keys) {
      startHour[day] = '1'; // Set your initial values here
      startMinute[day] = '00'; // Set your initial values here
      startAmPm[day] = 'AM'; // Set your initial values here
      endHour[day] = '1'; // Set your initial values here
      endMinute[day] = '00'; // Set your initial values here
      endAmPm[day] = 'AM'; // Set your initial values here
    }
  }

  bool isTimeOfDayBefore(TimeOfDay t1, TimeOfDay t2) {
    if (t1.hour < t2.hour) {
      return true;
    } else if (t1.hour == t2.hour) {
      return t1.minute < t2.minute;
    }
    return false;
  }

  bool isTimeOfDayAfter(TimeOfDay t1, TimeOfDay t2) {
    if (t1.hour > t2.hour) {
      return true;
    } else if (t1.hour == t2.hour) {
      return t1.minute > t2.minute;
    }
    return false;
  }

  void addTimeSlot(String day) {
    final start = '${startHour[day]}:${startMinute[day]} ${startAmPm[day]}';
    final end = '${endHour[day]}:${endMinute[day]} ${endAmPm[day]}';

    if (startHour[day] != null &&
        startMinute[day] != null &&
        startAmPm[day] != null &&
        endHour[day] != null &&
        endMinute[day] != null &&
        endAmPm[day] != null) {
      // Parse the new schedule times
      final newStartTime = parseTime(start);
      final newEndTime = parseTime(end);

      if (newStartTime != null && newEndTime != null) {
        bool isOverlap = schedule[day]!.any((existingSlot) {
          final existingStartTime = parseTime(existingSlot['Start']!);
          final existingEndTime = parseTime(existingSlot['End']!);

          if (existingStartTime != null && existingEndTime != null) {
            return (isTimeOfDayBefore(newStartTime, existingEndTime) &&
                isTimeOfDayAfter(newEndTime, existingStartTime));
          }
          return false;
        });

        if (!isOverlap) {
          setState(() {
            schedule[day]!.add({'Start': start, 'End': end});
            startHour[day] = null;
            startMinute[day] = null;
            startAmPm[day] = null;
            endHour[day] = null;
            endMinute[day] = null;
            endAmPm[day] = null;
          });
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Overlap Detected'),
                content: Text(
                    'The new schedule overlaps with an existing schedule for $day.'),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      }
    }
  }

  void deleteTimeSlot(String day, int index) {
    setState(() {
      schedule[day]!.removeAt(index);
    });
  }

  TimeOfDay? parseTime(String time) {
    final timePattern = RegExp(r'(\d+):(\d+) ([APap][Mm])');
    final match = timePattern.firstMatch(time);
    if (match != null) {
      var hours = int.parse(match.group(1)!);
      final minutes = int.parse(match.group(2)!);
      final amPm = match.group(3)!;
      if (hours == 12 && amPm.toLowerCase() == 'am') {
        hours = 0;
      } else if (hours != 12 && amPm.toLowerCase() == 'pm') {
        hours += 12;
      }
      return TimeOfDay(hour: hours, minute: minutes);
    }
    return null;
  }

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
                height: 200,
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
                              /* NavigationService()
                                  .navigateToScreen(AddClinicSecondPage());*/
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
                      child: Text(
                        "Please provide your Clinic times",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                height: 530,
                width: 1.sw,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: ListView(
                  children: [
                    for (var day in schedule.keys)
                      Container(
                         margin: EdgeInsets.all(4.0),
                        // Add margin to the container
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          // Add rounded corners
                          color: Colors.white,
                          // Set a white background for the card
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                day,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            for (int i = 0; i < schedule[day]!.length; i++)
                              ClinicScheduleCard(
                                start: schedule[day]![i]['Start']!,
                                end: schedule[day]![i]['End']!,
                                onDelete: () {
                                  deleteTimeSlot(day, i);
                                },
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Start Time"),
                                Text("End Time"),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: DropdownButton<String>(
                                      value: startHour[day],
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          startHour[day] = newValue;
                                        });
                                      },
                                      items:
                                          hours.map<DropdownMenuItem<String>>(
                                        (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                   SizedBox(width: 5.0), // Add spacing between dropdowns
                                  Expanded(
                                    child: DropdownButton<String>(
                                      value: startMinute[day],
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          startMinute[day] = newValue;
                                        });
                                      },
                                      items:
                                          minutes.map<DropdownMenuItem<String>>(
                                        (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                   SizedBox(width: 5.0), // Add spacing between dropdowns
                                  Expanded(
                                    child: DropdownButton<String>(
                                      value: startAmPm[day],
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          startAmPm[day] = newValue;
                                        });
                                      },
                                      items: amPm.map<DropdownMenuItem<String>>(
                                        (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                  Text(" to "),
                                  Expanded(
                                    child: DropdownButton<String>(
                                      value: endHour[day],
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          endHour[day] = newValue;
                                        });
                                      },
                                      items:
                                          hours.map<DropdownMenuItem<String>>(
                                        (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                   SizedBox(width: 5.0), // Add spacing between dropdowns
                                  Expanded(
                                    child: DropdownButton<String>(
                                      value: endMinute[day],
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          endMinute[day] = newValue;
                                        });
                                      },
                                      items:
                                          minutes.map<DropdownMenuItem<String>>(
                                        (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                   SizedBox(width: 5.0), // Add spacing between dropdowns
                                  Expanded(
                                    child: DropdownButton<String>(
                                      value: endAmPm[day],
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          endAmPm[day] = newValue;
                                        });
                                      },
                                      items: amPm.map<DropdownMenuItem<String>>(
                                        (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  addTimeSlot(day);
                                  setState(() {
                                    for (var day in schedule.keys) {
                                      startHour[day] = '1'; // Set your initial values here
                                      startMinute[day] = '00'; // Set your initial values here
                                      startAmPm[day] = 'AM'; // Set your initial values here
                                      endHour[day] = '1'; // Set your initial values here
                                      endMinute[day] = '00'; // Set your initial values here
                                      endAmPm[day] = 'AM'; // Set your initial values here
                                    }
                                  });
                                },
                                child: Text('Add Timing'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    /* ElevatedButton(
                      onPressed: () {
                        print(schedule);
                      },
                      child: Text('Add Schedule'),
                    ),*/
                  ],
                ),
              ),
              Container(
                height: 100,
                width: 1.sw,
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    print(schedule);
                    NavigationService().navigateToScreen(DoctorProfileEditPage(
                      initialTabIndex: 2,
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
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
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Add Schedule",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
