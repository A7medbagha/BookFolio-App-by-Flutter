part of 'featuredbooks_cubit.dart';

sealed class FeaturedbooksState extends Equatable {
  const FeaturedbooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedbooksInitial extends FeaturedbooksState {}
final class FeaturedbooksLoading extends FeaturedbooksState {}
final class FeaturedbooksFailure extends FeaturedbooksState {
  final String errMessage;

  const FeaturedbooksFailure({required this.errMessage});
}
final class FeaturedbooksSucess extends FeaturedbooksState {
  final List<BooksModel> books;

  const FeaturedbooksSucess({required this.books});
}

