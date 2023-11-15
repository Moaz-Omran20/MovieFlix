part of 'movie_detail_cubit.dart';

@immutable
abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}
class MovieDetailSuccess extends MovieDetailState {
  MovieDetailModel movieDetail;

  MovieDetailSuccess(this.movieDetail);
}
class MovieDetailLoading extends MovieDetailState {}
class MovieDetailFailure extends MovieDetailState {
  String errMessage;

  MovieDetailFailure(this.errMessage);
}
