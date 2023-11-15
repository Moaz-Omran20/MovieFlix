part of 'get_movies_by_category_cubit.dart';

@immutable
abstract class GetMoviesByCategoryState {}

class GetMoviesByCategoryInitial extends GetMoviesByCategoryState {}
class GetMoviesByCategorySuccess extends GetMoviesByCategoryState {
  List<MovieModel>movies;

  GetMoviesByCategorySuccess(this.movies);
}
class GetMoviesByCategoryFailure extends GetMoviesByCategoryState {
  String errMessage;

  GetMoviesByCategoryFailure(this.errMessage);
}
class GetMoviesByCategoryLoading extends GetMoviesByCategoryState {}
