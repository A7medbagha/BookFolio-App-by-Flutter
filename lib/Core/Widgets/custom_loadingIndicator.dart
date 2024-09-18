// ignore_for_file: file_names
import 'package:flutter/material.dart';

class CustomLoadingindicator extends StatelessWidget {
  const CustomLoadingindicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(color: Colors.white,));
  }
}
