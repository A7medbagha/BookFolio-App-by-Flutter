// ignore_for_file: file_names, deprecated_member_use
import 'package:bookapp/Core/errors/failures.dart';
import 'package:bookapp/Core/utils/api_services.dart';
import 'package:bookapp/Features/Home/Data/models/books_model/books_model.dart';
import 'package:bookapp/Features/Search/Data/Repo/SearchRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpliment implements SearchRepo{
  SearchRepoImpliment(this.apiServices);
  ApiServices apiServices;
  @override
  Future<Either<Failures, List<BooksModel>>> fetchSearchResults(String query) async{
    try {
      var data = await apiServices.get(
          endPoint:
              'volumes?q=$query');

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