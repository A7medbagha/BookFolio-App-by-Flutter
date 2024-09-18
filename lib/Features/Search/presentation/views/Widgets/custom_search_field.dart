import 'package:bookapp/Features/Search/presentation/views/view_model/searchCubit/search_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({super.key});

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: 'Search',
            suffixIcon: Opacity(
              opacity: .7,
              child: IconButton(
                  onPressed: () {
                    BlocProvider.of<SearchCubitCubit>(context).fetchSearchResults(query: _searchController.text);
                  },
                  icon: const Icon(FontAwesomeIcons.magnifyingGlass,color: Colors.white,)),
            )),
      ),
    );
  }
}