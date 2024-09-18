// ignore_for_file: file_names

import 'package:bookapp/Core/utils/styles.dart';
import 'package:bookapp/Features/Search/presentation/views/Widgets/Search_Results_ListViewItems.dart';
import 'package:bookapp/Features/Search/presentation/views/Widgets/custom_search_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSearchField(),
        Padding(
          padding: EdgeInsets.only(left: 20,bottom: 8),
          child: Text("Search Results",style: Styles.textStyle18,),
        ),
        Expanded(child: SearchResultsListViewItems()),
      ],
    );
  }
}
