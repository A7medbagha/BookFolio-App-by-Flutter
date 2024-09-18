import 'package:bookapp/Core/utils/api_services.dart';
import 'package:bookapp/Features/Home/Data/Repo/home_repo_implementation.dart';
import 'package:bookapp/Features/Search/Data/Repo/searchRepoImplementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomeRepoImplementation>(
      HomeRepoImplementation(getIt.get<ApiServices>()));
  getIt.registerSingleton<SearchRepoImpliment>(
      SearchRepoImpliment(getIt.get<ApiServices>()));
}
