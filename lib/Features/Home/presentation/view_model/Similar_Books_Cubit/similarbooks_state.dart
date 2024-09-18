part of 'similarbooks_cubit.dart';

sealed class SimilarbooksState extends Equatable {
  const SimilarbooksState();

  @override
  List<Object> get props => [];
}

final class SimilarbooksInitial extends SimilarbooksState {}
final class SimilarbooksFaliure extends SimilarbooksState {
  final String errMessage;

  const SimilarbooksFaliure({required this.errMessage});
}
final class SimilarbooksSucess extends SimilarbooksState {
  final List<BooksModel> books;

  const SimilarbooksSucess({required this.books});
}
final class SimilarbooksLoading extends SimilarbooksState {}

