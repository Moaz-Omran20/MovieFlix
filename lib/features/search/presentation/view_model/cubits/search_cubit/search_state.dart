part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchSuccess extends SearchState {
  List<MovieModel>searchedMovies;

  SearchSuccess(this.searchedMovies);
}
class SearchFailure extends SearchState {
  String errMessage;

  SearchFailure(this.errMessage);
}
class SearchLoading extends SearchState {}
