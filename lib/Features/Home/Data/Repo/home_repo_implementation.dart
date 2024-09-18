// ignore_for_file: deprecated_member_use

import 'package:bookapp/Core/errors/failures.dart';
import 'package:bookapp/Core/utils/api_services.dart';
import 'package:bookapp/Features/Home/Data/Repo/home_repo.dart';
import 'package:bookapp/Features/Home/Data/models/books_model/books_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepo {
  HomeRepoImplementation(this.apiServices);
  ApiServices apiServices;
  @override
  Future<Either<Failures, List<BooksModel>>> fetchNewestBooks() async {
    try {
      var data = await apiServices.get(
          endPoint:
              'volumes?q=subject:Programming&Sorting=newest&Filtering=free-ebooks');

      List<BooksModel> books = [];
      for (var item in data['items']) {
        books.add(BooksModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BooksModel>>> fetchFeaturdBooks() async {
    try {
      var data = await apiServices.get(
          endPoint:
              'volumes?q=api');

      List<BooksModel> books = [];
      for (var item in data['items']) {
        books.add(BooksModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failures, List<BooksModel>>> fetchSimilarBooks({required String category}) async{
    try {
      var data = await apiServices.get(
          endPoint:
              'volumes?q=api&Sorting=relevance');

      List<BooksModel> books = [];
      for (var item in data['items']) {
        books.add(BooksModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
