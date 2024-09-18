import 'package:bookapp/Core/utils/styles.dart';
import 'package:bookapp/Features/Home/presentation/views/widgets/bestSellerListView.dart';
import 'package:bookapp/Features/Home/presentation/views/widgets/custom_Appbar.dart';
import 'package:bookapp/Features/Home/presentation/views/widgets/items_of_listView.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppbar(),
              ItemsOfListView(),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Best Seller',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 17,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: MainBestSellerListViewItems(),
        )
      ],
    );
  }
}
