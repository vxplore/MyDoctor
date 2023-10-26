/*
import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Doctor Clinic Schedule'),
        ),
        body: ClinicSchedule(),
      ),
    );
  }
}

class ClinicSchedule extends StatefulWidget {
  @override
  _ClinicScheduleState createState() => _ClinicScheduleState();
}

class _ClinicScheduleState extends State<ClinicSchedule> {
  Map<String, List<Map<String, String>>> schedule = {
    'Sunday': [],
    'Monday': [],
    'Tuesday': [],
    // Add more days as needed
  };

  Map<String, TextEditingController> startControllers = {};
  Map<String, TextEditingController> endControllers = {};

  @override
  Widget build(BuildContext context) {
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
      final start = startControllers[day]!.text;
      final end = endControllers[day]!.text;

      if (start.isNotEmpty && end.isNotEmpty) {
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
              startControllers[day]!.clear();
              endControllers[day]!.clear();
            });
          } else {
            // Display an error message or handle the overlap as needed
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Overlap Detected'),
                  content: Text('The new schedule overlaps with an existing schedule for $day.'),
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

    return ListView(
      children: [
        for (var day in schedule.keys)
          Column(
            children: [
              Text(day, style: TextStyle(fontSize: 20)),
              for (int i = 0; i < schedule[day]!.length; i++)
                ClinicScheduleCard(
                  start: schedule[day]![i]['Start']!,
                  end: schedule[day]![i]['End']!,
                  onDelete: () {
                    deleteTimeSlot(day, i);
                  },
                ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: startControllers[day],
                      decoration: InputDecoration(labelText: 'Start Time'),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: endControllers[day],
                      decoration: InputDecoration(labelText: 'End Time'),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      addTimeSlot(day);
                    },
                  ),
                ],
              ),
            ],
          ),
        ElevatedButton(
          onPressed: () {
            print(schedule);
          },
          child: Text('Add Schedule'),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    for (var day in schedule.keys) {
      startControllers[day] = TextEditingController();
      endControllers[day] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (var controller in startControllers.values) {
      controller.dispose();
    }
    for (var controller in endControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  TimeOfDay? parseTime(String time) {
    final timePattern = RegExp(r'(\d+)(:(\d+))?([APap][Mm])?$');
    final match = timePattern.firstMatch(time);
    if (match != null) {
      var hours = int.parse(match.group(1)!);
      final minutes = match.group(3) != null ? int.parse(match.group(3)!) : 0;
      final isPM = match.group(4) != null && (match.group(4)!.toLowerCase() == 'pm');
      if (isPM && hours < 12) {
        hours += 12;
      } else if (!isPM && hours == 12) {
        hours = 0;
      }
      return TimeOfDay(hour: hours, minute: minutes);
    }
    return null;
  }
}

class ClinicScheduleCard extends StatelessWidget {
  final String start;
  final String end;
  final VoidCallback onDelete;

  ClinicScheduleCard({
    required this.start,
    required this.end,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Start: $start'),
        subtitle: Text('End: $end'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
*/

///////2ND//////////////////////
///////////////////////@ND TESTR////////////////////
/*
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Doctor Clinic Schedule'),
          backgroundColor: Colors.blue,
        ),
        body: ClinicSchedule(),
      ),
    );
  }
}

class MyAppConstants {
  static List<String> hours = List.generate(12, (int index) => (index + 1).toString());
  static List<String> minutes =  ['00', '30'];
  static List<String> amPm = ['AM', 'PM'];
}

class ClinicSchedule extends StatefulWidget {
  @override
  _ClinicScheduleState createState() => _ClinicScheduleState();
}

class _ClinicScheduleState extends State<ClinicSchedule> {
  Map<String, List<Map<String, String>>> schedule = {
    'Sunday': [],
    'Monday': [],
    'Tuesday': [],
    // Add more days as needed
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

  @override
  Widget build(BuildContext context) {
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
                  content: Text('The new schedule overlaps with an existing schedule for $day.'),
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

    return Scaffold(
      backgroundColor: Colors.grey[200], // Set a light gray background
      body: ListView(
        children: [
          for (var day in schedule.keys)
            Container(
              margin: EdgeInsets.all(16.0), // Add margin to the container
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0), // Add rounded corners
                color: Colors.white, // Set a white background for the card
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
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
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                            items: MyAppConstants.hours.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                        // SizedBox(width: 10.0), // Add spacing between dropdowns
                        Expanded(
                          child: DropdownButton<String>(
                            value: startMinute[day],
                            onChanged: (String? newValue) {
                              setState(() {
                                startMinute[day] = newValue;
                              });
                            },
                            items: MyAppConstants.minutes.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                        // SizedBox(width: 10.0), // Add spacing between dropdowns
                        Expanded(
                          child: DropdownButton<String>(
                            value: startAmPm[day],
                            onChanged: (String? newValue) {
                              setState(() {
                                startAmPm[day] = newValue;
                              });
                            },
                            items: MyAppConstants.amPm.map<DropdownMenuItem<String>>(
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
                            items: MyAppConstants.hours.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                        // SizedBox(width: 10.0), // Add spacing between dropdowns
                        Expanded(
                          child: DropdownButton<String>(
                            value: endMinute[day],
                            onChanged: (String? newValue) {
                              setState(() {
                                endMinute[day] = newValue;
                              });
                            },
                            items: MyAppConstants.minutes.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                        // SizedBox(width: 1.0), // Add spacing between dropdowns
                        Expanded(
                          child: DropdownButton<String>(
                            value: endAmPm[day],
                            onChanged: (String? newValue) {
                              setState(() {
                                endAmPm[day] = newValue;
                              });
                            },
                            items: MyAppConstants.amPm.map<DropdownMenuItem<String>>(
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
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      addTimeSlot(day);
                    },
                  ),
                ],
              ),
            ),
          ElevatedButton(
            onPressed: () {
              print(schedule);
            },
            child: Text('Add Schedule'),
          ),
        ],
      ),
    );
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
}

class ClinicScheduleCard extends StatelessWidget {
  final String start;
  final String end;
  final VoidCallback onDelete;

  ClinicScheduleCard({
    required this.start,
    required this.end,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          'Start: $start',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('End: $end'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}

*/
