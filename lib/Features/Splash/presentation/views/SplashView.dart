// ignore_for_file: file_names

import 'package:bookapp/Features/Splash/presentation/views/Widgets/SplashViewBody.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class splashView extends StatelessWidget {
  const splashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: splashViewBody(),
    );
  }
}