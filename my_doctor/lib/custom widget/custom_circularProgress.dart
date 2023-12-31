import 'package:flutter/material.dart';

Widget MyCircularIndicator() {
  return Center(
    child: CircularProgressIndicator(
      backgroundColor: Color(0xffFF3E49),
      valueColor: AlwaysStoppedAnimation(Color(0xff41CFD9)),
      strokeWidth: 4,
    ),
  );
}