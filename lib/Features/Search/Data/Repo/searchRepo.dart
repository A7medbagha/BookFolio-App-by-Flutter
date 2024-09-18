import 'package:bookapp/Core/errors/failures.dart';
import 'package:bookapp/Features/Home/Data/models/books_model/books_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
    Future<Either<Failures, List<BooksModel>>> fetchSearchResults(String query);
}