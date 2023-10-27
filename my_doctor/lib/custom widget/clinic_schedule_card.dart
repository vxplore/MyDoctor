import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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