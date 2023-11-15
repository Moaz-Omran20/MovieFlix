part of 'new_releases_cubit.dart';

@immutable
abstract class NewReleasesState {}

class NewReleasesInitial extends NewReleasesState {}

class NewReleasesSuccess extends NewReleasesState {
  List<MovieModel> newReleasesMovies;

  NewReleasesSuccess(this.newReleasesMovies);
}

class NewReleasesFailure extends NewReleasesState {
  String errMessage;

  NewReleasesFailure(this.errMessage);
}

class NewReleasesLoading extends NewReleasesState {}
