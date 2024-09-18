import 'package:bookapp/Core/utils/styles.dart';
import 'package:bookapp/Features/Home/Data/models/books_model/books_model.dart';
import 'package:bookapp/Features/Home/presentation/views/widgets/YouCanAlsoLike_listview.dart';
import 'package:bookapp/Features/Home/presentation/views/widgets/bestSellerListView.dart';
import 'package:bookapp/Features/Home/presentation/views/widgets/customBookDetailsAppBar.dart';
import 'package:bookapp/Features/Home/presentation/views/widgets/customBookImage.dart';
import 'package:bookapp/Features/Home/presentation/views/widgets/custom_button_Action.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.booksModel});
  final BooksModel booksModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                const SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.28),
                  child: CustomBookImage(
                      imgUrl:
                          booksModel.volumeInfo.imageLinks?.thumbnail ?? ''),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  booksModel.volumeInfo.title!,
                  style: Styles.textStyle27,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 3,
                ),
                Opacity(
                  opacity: .7,
                  child: Text(
                    booksModel.volumeInfo.authors![0],
                    style: Styles.textStyle18italic,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                NumberOfPages(
                  pageCounts: booksModel.volumeInfo.pageCount!,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                const SizedBox(
                  height: 17,
                ),
                CustomButtonAction(
                  booksModel: booksModel,
                ),
                const Expanded(
                    child: SizedBox(
                  height: 30,
                )),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "You can also like",
                      style: Styles.textStyle18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const YoucanalsolikeListview(),
              ],
            ))
      ],
    );
  }
}
