// ignore_for_file: file_names

import 'package:bookapp/Core/utils/app_router.dart';
import 'package:bookapp/Core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 44, left: 10,right: 10,bottom: 25),
      child: Row(
        children: [
          Image.asset(AssetsData.logo,
          height: 80,
          ),
          const Spacer(),
          IconButton(onPressed: (){
            GoRouter.of(context).push(AppRouter.searchViewBody);
          }, icon: const Icon(FontAwesomeIcons.magnifyingGlass,color: Colors.white,))
        ],
      ),
    );
  }
}