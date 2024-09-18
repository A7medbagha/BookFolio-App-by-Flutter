// ignore_for_file: file_names

import 'package:bookapp/Core/Widgets/Custom_errMessage.dart';
import 'package:bookapp/Core/Widgets/custom_loadingIndicator.dart';
import 'package:bookapp/Core/utils/app_router.dart';
import 'package:bookapp/Core/utils/styles.dart';
import 'package:bookapp/Features/Home/Data/models/books_model/books_model.dart';
import 'package:bookapp/Features/Home/presentation/view_model/Newest_Books_Cubit/newestbooks_cubit.dart';
import 'package:bookapp/Features/Home/presentation/views/widgets/customBookImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainBestSellerListViewItems extends StatelessWidget {
  const MainBestSellerListViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestbooksCubit, NewestbooksState>(
      builder: (context, state) {
        if (state is NewestbookSucess) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BestSellerListView(
                    booksModel: state.books[index],
                  ),
                );
              });
        } else if (state is NewestbooksFaliure) {
          return CustomErrmessage(errMessage: state.errMessage);
        } else {
          return const CustomLoadingindicator();
        }
      },
    );
  }
}

//-------------------------------------------------------------------//

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
    required this.booksModel,
  });
  final BooksModel booksModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetailsPath,
        extra: booksModel
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SizedBox(
          height: 111,
          child: Row(
            children: [
              CustomBookImage(
                  imgUrl: booksModel.volumeInfo.imageLinks?.thumbnail ?? ''),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * .5,
                        child: Text(
                          booksModel.volumeInfo.title!,
                          style: Styles.textStyle19,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      booksModel.volumeInfo.authors![0],
                      style: Styles.textStyle14,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Free',
                          style: Styles.textStyle19,
                        ),
                        const Spacer(),
                        NumberOfPages(
                          pageCounts: booksModel.volumeInfo.pageCount!,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NumberOfPages extends StatelessWidget {
  const NumberOfPages(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.pageCounts});

  final int pageCounts;

  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          '($pageCounts) Pages',
          style: Styles.textStyle14,
        ),
      ],
    );
  }
}
