import 'package:bookapp/Core/utils/service_locator.dart';
import 'package:bookapp/Features/Home/Data/Repo/home_repo_implementation.dart';
import 'package:bookapp/Features/Home/Data/models/books_model/books_model.dart';
import 'package:bookapp/Features/Home/presentation/view_model/Similar_Books_Cubit/similarbooks_cubit.dart';
import 'package:bookapp/Features/Home/presentation/views/book_details_view.dart';
import 'package:bookapp/Features/Home/presentation/views/home_view.dart';
import 'package:bookapp/Features/Search/Data/Repo/searchRepoImplementation.dart';
import 'package:bookapp/Features/Search/presentation/views/Search_view.dart';
import 'package:bookapp/Features/Search/presentation/views/view_model/searchCubit/search_cubit_cubit.dart';
import 'package:bookapp/Features/Splash/presentation/views/SplashView.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const homeViewPath = '/homeView';
  static const bookDetailsPath = '/BookDetailsView';
  static const searchViewBody = "/SearchViewBody";

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const splashView()),
    GoRoute(path: homeViewPath, builder: (context, state) => const HomeView()),
    GoRoute(
        path: bookDetailsPath,
        builder: (context, state) => BlocProvider(
              create: (context) =>
                  SimilarbooksCubit(getIt.get<HomeRepoImplementation>()),
              child: BookDetailsView(
                booksModel: state.extra as BooksModel,
              ),
            )),
    GoRoute(
        path: searchViewBody,
        builder: (context, state) => BlocProvider(
              create: (context) => SearchCubitCubit(getIt.get<SearchRepoImpliment>()),
              child: const SearchView(),
            )),
  ]);
}
