import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/home/data/models/movie_model/MovieModel.dart';
import 'package:movies_app/features/movie_details/data/movie_detail_repo/related_movies/related_movies_implementation.dart';
part 'related_movies_state.dart';

class RelatedMoviesCubit extends Cubit<RelatedMoviesState> {
  RelatedMoviesCubit(this.relatedMoviesRepo) : super(RelatedMoviesInitial());
  RelatedMoviesImplementation relatedMoviesRepo;

  Future<void> fetchRelatedMovies(num id) async {
    emit(RelatedMoviesLoading());
    var results = await relatedMoviesRepo.fetchRelatedMovies(id: id);
    results.fold((failure) => emit(RelatedMoviesFailure(failure.errMessage)),
        (relatedMovies) => emit(RelatedMoviesSuccess(relatedMovies)));
  }
}
