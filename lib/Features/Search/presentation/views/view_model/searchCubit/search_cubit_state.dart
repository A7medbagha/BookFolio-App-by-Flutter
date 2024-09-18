part of 'search_cubit_cubit.dart';

sealed class SearchCubitState extends Equatable {
  const SearchCubitState();

  @override
  List<Object> get props => [];
}

final class SearchCubitInitial extends SearchCubitState {}
final class SearchCubitLoading extends SearchCubitState {}
final class SearchCubitSucess extends SearchCubitState {
  final List books;

  const SearchCubitSucess({required this.books});
}
final class SearchCubitFaliure extends SearchCubitState {
  final String errMessage;

  const SearchCubitFaliure({required this.errMessage});
}

