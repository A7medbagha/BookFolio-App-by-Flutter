// ignore_for_file: file_names
import 'package:bookapp/Core/Widgets/Custom_errMessage.dart';
import 'package:bookapp/Core/Widgets/custom_loadingIndicator.dart';
import 'package:bookapp/Core/utils/app_router.dart';
import 'package:bookapp/Features/Home/presentation/view_model/Featured_Books_Cubit/featuredbooks_cubit.dart';
import 'package:bookapp/Features/Home/presentation/views/widgets/customBookImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ItemsOfListView extends StatelessWidget {
  const ItemsOfListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedbooksCubit, FeaturedbooksState>(
      builder: (context, state) {
        if(state is FeaturedbooksSucess){
        return Padding(
          padding: const EdgeInsets.only(bottom: 22, left: 5),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .28,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: GestureDetector(
                      onTap: (){
                        GoRouter.of(context).push(AppRouter.bookDetailsPath,
                        extra: state.books[index],
                        );
                      },
                      child: CustomBookImage(imgUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? '')),
                  );
                }),
          ),
        );
      }else if (state is FeaturedbooksFailure){
        return CustomErrmessage(errMessage: state.errMessage);
      }else {
        return const CustomLoadingindicator();
      }
      },
    );
  }
}
