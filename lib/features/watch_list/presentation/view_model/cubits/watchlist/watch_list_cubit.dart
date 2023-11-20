import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/core/utils/favourite_movie_model.dart';
part 'watch_list_state.dart';

class WatchListCubit extends Cubit<WatchListState> {
  WatchListCubit() : super(WatchListInitial()){
    watchListMoviesList();
  }


  Box<FavouriteMovieModel> moviesBox = Hive.box<FavouriteMovieModel>("moviesWatchList");

  List<FavouriteMovieModel> movies = [];


  void watchListMoviesList() {
    movies = moviesBox.values.toList();
  }

  Future<void> toggleWatchList(num movieId, FavouriteMovieModel movie) async {
    if (moviesBox.keys.contains(movieId)) {
      await removeItemFromDataBase(movieId);
    } else {
      await addItemToDataBase(movieId, movie);
    }
  }

  Future<void> addItemToDataBase(num movieId, FavouriteMovieModel movie) async {
    await moviesBox.put(movieId, movie);
    watchListMoviesList();
    emitWatchListState();
  }

  Future<void> removeItemFromDataBase(num movieId) async {
    await moviesBox.delete(movieId);
    watchListMoviesList();
    emitWatchListState();
  }

  void emitWatchListState() {
    if (movies.isNotEmpty) {
      emit(WatchListed(movies));
    } else {
      emit(NotWatchListed());
    }
  }

}
