part of 'add_movie_cubit.dart';

@immutable
abstract class AddMovieState {}

class AddMovieInitial extends AddMovieState {}
class AddMovieSuccess extends AddMovieState {}
class AddMovieExists extends AddMovieState {
  bool selected ;

  AddMovieExists(this.selected);
}
class AddMovieDelete extends AddMovieState{}
