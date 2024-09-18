import 'package:bloc/bloc.dart';
import 'package:bookapp/Features/Home/Data/Repo/home_repo.dart';
import 'package:bookapp/Features/Home/Data/models/books_model/books_model.dart';
import 'package:equatable/equatable.dart';

part 'similarbooks_state.dart';

class SimilarbooksCubit extends Cubit<SimilarbooksState> {
  SimilarbooksCubit(this.homeRepo) : super(SimilarbooksInitial());

    final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async{
    emit(SimilarbooksLoading());
   var results = await homeRepo.fetchSimilarBooks(category: category);

   results.fold((faliure){
    emit(SimilarbooksFaliure(errMessage: faliure.errMessage));
   }, (books){
    emit(SimilarbooksSucess(books: books));
   });
  }
}
