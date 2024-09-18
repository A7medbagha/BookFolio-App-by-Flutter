// ignore_for_file: file_names

import 'package:bookapp/Core/Widgets/Custom_errMessage.dart';
import 'package:bookapp/Core/Widgets/custom_loadingIndicator.dart';
import 'package:bookapp/Core/utils/app_router.dart';
import 'package:bookapp/Features/Home/presentation/view_model/Similar_Books_Cubit/similarbooks_cubit.dart';
import 'package:bookapp/Features/Home/presentation/views/widgets/customBookImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class YoucanalsolikeListview extends StatelessWidget {
  const YoucanalsolikeListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarbooksCubit, SimilarbooksState>(
      builder: (context, state) {
        if (state is SimilarbooksSucess) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 22),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .17,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.books.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(
                            AppRouter.bookDetailsPath,
                            extra: state.books[index],
                          );
                        },
                        child: CustomBookImage(
                          imgUrl: state.books[index].volumeInfo.imageLinks
                                  ?.thumbnail ??
                              '',
                        ),
                      ),
                    );
                  }),
            ),
          );
        } else if (state is SimilarbooksFaliure) {
          return CustomErrmessage(errMessage: state.errMessage);
        } else {
          return const CustomLoadingindicator();
        }
      },
    );
  }
}
