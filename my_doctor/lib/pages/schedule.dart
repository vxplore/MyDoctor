/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    return ListView(
      children: [
        for (var day in schedule.keys)
          Column(
            children: [
              Text(day, style: TextStyle(fontSize: 20)),
              for (var slot in schedule[day]!)
                ClinicScheduleCard(
                  start: slot['Start']!,
                  end: slot['End']!,
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
                      // Add the time slot to the schedule
                      addTimeSlot(day);
                    },
                  ),
                ],
              ),
            ],
          ),
        ElevatedButton(
          onPressed: () {
            // Send the schedule data to the server
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
    // Initialize controllers for each day
    for (var day in schedule.keys) {
      startControllers[day] = TextEditingController();
      endControllers[day] = TextEditingController();
    }
  }

  @override
  void dispose() {
    // Dispose of controllers to prevent memory leaks
    for (var controller in startControllers.values) {
      controller.dispose();
    }
    for (var controller in endControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void addTimeSlot(String day) {
    final start = startControllers[day]!.text;
    final end = endControllers[day]!.text;

    if (start.isNotEmpty && end.isNotEmpty) {
      setState(() {
        schedule[day]!.add({'Start': start, 'End': end});
        startControllers[day]!.clear();
        endControllers[day]!.clear();
      });
    }
  }


}

class ClinicScheduleCard extends StatelessWidget {
  final String start;
  final String end;

  ClinicScheduleCard({required this.start, required this.end});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Start: $start'),
        subtitle: Text('End: $end'),
      ),
    );
  }
}
*/
