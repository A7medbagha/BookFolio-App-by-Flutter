// ignore_for_file: file_names
import 'package:bookapp/Core/Widgets/Custom_errMessage.dart';
import 'package:bookapp/Core/Widgets/custom_loadingIndicator.dart';
import 'package:bookapp/Features/Search/presentation/views/Widgets/Custom_Results_ListView.dart';
import 'package:bookapp/Features/Search/presentation/views/view_model/searchCubit/search_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsListViewItems extends StatelessWidget {
  const SearchResultsListViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubitCubit, SearchCubitState>(
      builder: (context, state) {
        if (state is SearchCubitSucess) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SearchResultsListview(
                    booksModel: state.books[index],
                  ),
                );
              });
        } else if (state is SearchCubitFaliure) {
          return CustomErrmessage(errMessage: state.errMessage);
        } else if (state is SearchCubitLoading) {
          return const CustomLoadingindicator();
        } else {
          return const Text('');
        }
      },
    );
  }
}
