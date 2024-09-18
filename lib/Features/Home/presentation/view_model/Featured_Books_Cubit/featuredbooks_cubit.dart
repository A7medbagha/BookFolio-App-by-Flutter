import 'package:bloc/bloc.dart';
import 'package:bookapp/Features/Home/Data/Repo/home_repo.dart';
import 'package:bookapp/Features/Home/Data/models/books_model/books_model.dart';
import 'package:equatable/equatable.dart';

part 'featuredbooks_state.dart';

class FeaturedbooksCubit extends Cubit<FeaturedbooksState> {
  FeaturedbooksCubit(this.homeRepo) : super(FeaturedbooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFeatcuredBooks () async{
    emit(FeaturedbooksLoading());
    var results = await homeRepo.fetchFeaturdBooks();
    results.fold((failure){
      emit(FeaturedbooksFailure(errMessage: failure.errMessage));
    }, (books){
      emit(FeaturedbooksSucess(books: books));
    }); 
  }
}
