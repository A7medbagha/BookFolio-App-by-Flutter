import 'package:bookapp/Features/Home/Data/models/books_model/books_model.dart';
import 'package:bookapp/Features/Home/presentation/view_model/Similar_Books_Cubit/similarbooks_cubit.dart';
import 'package:bookapp/Features/Home/presentation/views/widgets/book_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.booksModel});
  final BooksModel booksModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarbooksCubit>(context).fetchSimilarBooks(category: widget.booksModel.volumeInfo.categories![0]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: BookDetailsBody(booksModel: widget.booksModel,)),
    );
  }
}