import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';
import '../../../../data/models/movie_model/MovieModel.dart';
import '../../../../data/models/popular_model/PopularModel.dart';
part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit(this.homeRepo) : super(PopularMoviesInitial());

  final HomeRepo homeRepo;

  Future<void> fetchPopularMovies() async {
    emit(PopularMoviesLoading());
    var results = await homeRepo.fetchMoviesPopular();
    results.fold((failure) => emit(PopularMoviesFailure(failure.errMessage)),
        (popularMovies) => emit(PopularMoviesSuccess(popularMovies)));
  }
}
