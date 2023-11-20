import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';
import '../../../../data/models/movie_model/MovieModel.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  TopRatedMoviesCubit(this.homeRepo) : super(TopRatedMoviesInitial());

  final HomeRepo homeRepo;

  Future<void> fetchTopRatedMovies() async {
    emit(TopRatedMoviesLoading());
    var results = await homeRepo.fetchMoviesTopRated();
    results.fold((failure) => emit(TopRatedMoviesFailure(failure.errMessage)),
        (topRatedMovies) => emit(TopRatedMoviesSuccess(topRatedMovies)));
  }
}
