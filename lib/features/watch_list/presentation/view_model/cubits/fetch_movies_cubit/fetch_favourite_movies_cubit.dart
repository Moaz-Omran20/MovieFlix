import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/features/home/data/models/movie_model/MovieModel.dart';

import '../../../../../../core/utils/favourite_movie_model.dart';

part 'fetch_favourite_movies_state.dart';

class FetchFavouriteMoviesCubit extends Cubit<FetchFavouriteMoviesState> {
  FetchFavouriteMoviesCubit() : super(FetchFavouriteMoviesInitial());


  List<FavouriteMovieModel>?movies;
  fetchFavouriteMovies() {
      var movieBox = Hive.box<FavouriteMovieModel>(kFavouriteMovies);
       movies =movieBox.values.toList();
      emit(FetchFavouriteMoviesSuccess(movies!));
  }
}
