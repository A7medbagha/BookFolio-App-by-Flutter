// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customUrlLauncher(context ,String? theUrl) async {
  if (theUrl != null) {
  Uri url = Uri.parse(theUrl);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  }else{
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sorry, cannot launch $theUrl'))
    );
  }
}
}
