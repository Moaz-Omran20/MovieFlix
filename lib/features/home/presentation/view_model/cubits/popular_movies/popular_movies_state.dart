part of 'popular_movies_cubit.dart';

@immutable
abstract class PopularMoviesState {}

class PopularMoviesInitial extends PopularMoviesState {}
class PopularMoviesSuccess extends PopularMoviesState {
  List<MovieModel> popularMovies;

  PopularMoviesSuccess(this.popularMovies);
}
class PopularMoviesLoading extends PopularMoviesState {}
class PopularMoviesFailure extends PopularMoviesState {
  String errMessage;

  PopularMoviesFailure(this.errMessage);
}
