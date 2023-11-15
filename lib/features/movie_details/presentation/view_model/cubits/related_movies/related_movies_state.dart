part of 'related_movies_cubit.dart';

@immutable
abstract class RelatedMoviesState {}

class RelatedMoviesInitial extends RelatedMoviesState {}
class RelatedMoviesSuccess extends RelatedMoviesState {
  List<MovieModel>relatedMovies;

  RelatedMoviesSuccess(this.relatedMovies);
}
class RelatedMoviesLoading extends RelatedMoviesState {}
class RelatedMoviesFailure extends RelatedMoviesState {
  String errMessage;

  RelatedMoviesFailure(this.errMessage);
}
