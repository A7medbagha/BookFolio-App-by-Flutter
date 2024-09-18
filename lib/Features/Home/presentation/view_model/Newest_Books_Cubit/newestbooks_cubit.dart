import 'package:bloc/bloc.dart';
import 'package:bookapp/Features/Home/Data/Repo/home_repo.dart';
import 'package:bookapp/Features/Home/Data/models/books_model/books_model.dart';
import 'package:equatable/equatable.dart';

part 'newestbooks_state.dart';

class NewestbooksCubit extends Cubit<NewestbooksState> {
  NewestbooksCubit(this.homeRepo) : super(NewestbooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async{
    emit(NewestbooksLoading());
   var results = await homeRepo.fetchNewestBooks();

   results.fold((faliure){
    emit(NewestbooksFaliure(errMessage: faliure.errMessage));
   }, (books){
    emit(NewestbookSucess(books: books));
   });
  }
}
