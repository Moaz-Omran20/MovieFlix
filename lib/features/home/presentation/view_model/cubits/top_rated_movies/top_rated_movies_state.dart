part of 'top_rated_movies_cubit.dart';

@immutable
abstract class TopRatedMoviesState {}

class TopRatedMoviesInitial extends TopRatedMoviesState {}
class TopRatedMoviesSuccess extends TopRatedMoviesState {
  List<MovieModel> topRatedMovies;

  TopRatedMoviesSuccess(this.topRatedMovies);
}
class TopRatedMoviesLoading extends TopRatedMoviesState {}
class TopRatedMoviesFailure extends TopRatedMoviesState {
  String errMessage;

  TopRatedMoviesFailure(this.errMessage);
}
