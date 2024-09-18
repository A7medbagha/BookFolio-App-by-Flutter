// ignore_for_file: file_names
import 'package:bookapp/Features/Search/presentation/views/Widgets/Search_View_Body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SearchViewBody()
      ),
    );
  }
}