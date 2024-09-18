// ignore_for_file: file_names
import 'package:bookapp/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrmessage extends StatelessWidget {
  const CustomErrmessage({super.key, required this.errMessage});
  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errMessage, style: Styles.textStyle16,));
  }
}