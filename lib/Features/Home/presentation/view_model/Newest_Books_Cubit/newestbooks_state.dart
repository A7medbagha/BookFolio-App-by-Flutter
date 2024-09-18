part of 'newestbooks_cubit.dart';

sealed class NewestbooksState extends Equatable {
  const NewestbooksState();

  @override
  List<Object> get props => [];
}

final class NewestbooksInitial extends NewestbooksState {}
final class NewestbooksLoading extends NewestbooksState {}
final class NewestbooksFaliure extends NewestbooksState {
  final String errMessage;

  const NewestbooksFaliure({required this.errMessage});
}
final class NewestbookSucess extends NewestbooksState {
  final List<BooksModel> books;

  const NewestbookSucess({required this.books});
}

