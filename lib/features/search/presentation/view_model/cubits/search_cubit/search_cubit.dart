import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/search/data/repo/search_implementation.dart';

import '../../../../../home/data/models/movie_model/MovieModel.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchImplementation) : super(SearchInitial());

  SearchImplementation searchImplementation;

  Future<void> fetchSearchedMovies({required String name}) async {
    emit(SearchLoading());
    var results = await searchImplementation.fetchSearchedMovies(name: name);
    results.fold((failure) => emit(SearchFailure(failure.errMessage)), (
        searchedMovies) => emit(SearchSuccess(searchedMovies)));
  }

}
