import 'package:bloc/bloc.dart';
import 'package:bookapp/Features/Search/Data/Repo/SearchRepo.dart';
import 'package:equatable/equatable.dart';

part 'search_cubit_state.dart';

class SearchCubitCubit extends Cubit<SearchCubitState> {
  SearchCubitCubit(this.searchrepo) : super(SearchCubitInitial());
    final SearchRepo searchrepo;

  Future<void> fetchSearchResults({required String query}) async{
    emit(SearchCubitLoading());
   var results = await searchrepo.fetchSearchResults(query);

   results.fold((faliure){
    emit(SearchCubitFaliure(errMessage: faliure.errMessage));
   }, (books){
    emit(SearchCubitSucess(books: books));
   });
  }
}
