import 'package:bookapp/Core/utils/app_router.dart';
import 'package:bookapp/Core/utils/service_locator.dart';
import 'package:bookapp/Features/Home/Data/Repo/home_repo_implementation.dart';
import 'package:bookapp/Features/Home/presentation/view_model/Featured_Books_Cubit/featuredbooks_cubit.dart';
import 'package:bookapp/Features/Home/presentation/view_model/Newest_Books_Cubit/newestbooks_cubit.dart';
import 'package:bookapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupGetIt();
  runApp(const BookFolio());
}

class BookFolio extends StatelessWidget {
  const BookFolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                FeaturedbooksCubit(getIt.get<HomeRepoImplementation>())..fetchFeatcuredBooks()),
        BlocProvider(
            create: (context) =>
                NewestbooksCubit(getIt.get<HomeRepoImplementation>())..fetchNewestBooks()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mainColor,
        ),
      ),
    );
  }
}
