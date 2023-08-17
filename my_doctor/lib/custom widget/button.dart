import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ourButton({onPress, color, textColor, String? title}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
          padding: const EdgeInsets.all(12),
          backgroundColor: color),
      onPressed: onPress,
      child: Text(
        title!,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold,fontSize: 20),
      ));
}
