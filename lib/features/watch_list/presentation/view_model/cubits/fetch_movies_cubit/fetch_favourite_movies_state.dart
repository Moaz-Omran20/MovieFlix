part of 'fetch_favourite_movies_cubit.dart';

@immutable
abstract class FetchFavouriteMoviesState {}

class FetchFavouriteMoviesInitial extends FetchFavouriteMoviesState {}
class FetchFavouriteMoviesSuccess extends FetchFavouriteMoviesState {
  List<FavouriteMovieModel>favouriteMovies;

  FetchFavouriteMoviesSuccess(this.favouriteMovies);
}

