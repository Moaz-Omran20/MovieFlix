part of 'watch_list_cubit.dart';

@immutable
abstract class WatchListState {}

class WatchListInitial extends WatchListState {}

 class WatchListed extends WatchListState {
  List<FavouriteMovieModel> favouriteMovies;

  WatchListed(this.favouriteMovies);
}

 class NotWatchListed extends WatchListState {}
