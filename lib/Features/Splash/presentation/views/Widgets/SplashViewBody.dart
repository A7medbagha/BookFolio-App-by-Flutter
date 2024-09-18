// ignore_for_file: file_names, camel_case_types

import 'package:bookapp/Core/utils/app_router.dart';
import 'package:bookapp/Core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class splashViewBody extends StatefulWidget {
  const splashViewBody({super.key});

  @override
  State<splashViewBody> createState() => _splashViewBodyState();
}

class _splashViewBodyState extends State<splashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    slidingAnimationMethod();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AssetsData.logo,
          height: 160,
        ),
        const SizedBox(height: 10,),
        AnimatedBuilder(
            animation: slideAnimation,
            builder: (context, _) {
              return SlideTransition(
                  position: slideAnimation,
                  child: const Text(
                    'Your Digital Bookshelf',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                       fontFamily: FontsData.loraFont,
                       
                        ),
                  ));
            })
      ],
    );
  }

  //--------------------------------------------Functions---------------------------------------------//
  void slidingAnimationMethod() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slideAnimation = Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).push(AppRouter.homeViewPath);
    });
  }
}
