import 'package:bookapp/Core/errors/failures.dart';
import 'package:bookapp/Features/Home/Data/models/books_model/books_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BooksModel>>> fetchFeaturdBooks();
  Future<Either<Failures, List<BooksModel>>> fetchNewestBooks();
  Future<Either<Failures, List<BooksModel>>> fetchSimilarBooks(
      {required String category});
}
