/*
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://flutter.dev');

void main() => runApp(
  const MaterialApp(
    home: Material(
      child: Center(
        child: ElevatedButton(
          onPressed: _launchUrl,
          child: Text('Show Flutter homepage'),
        ),
      ),
    ),
  ),
);

Future<void> _launchUrl() async {
  if (!await launchUrl(Uri.parse("https://pub.dev/packages/url_launcher"))) {
    throw Exception('Could not launch $_url');
  }
}
*/
