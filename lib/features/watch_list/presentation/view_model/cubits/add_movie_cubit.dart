import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/features/home/data/models/movie_model/MovieModel.dart';

import '../../../../../core/utils/favourite_movie_model.dart';

part 'add_movie_state.dart';

class AddMovieCubit extends Cubit<AddMovieState> {
  AddMovieCubit() : super(AddMovieSuccess());

  addMovie(FavouriteMovieModel movie) async {
      var movieBox = Hive.box<FavouriteMovieModel>(kFavouriteMovies);
      await movieBox.add(movie);
      emit(AddMovieSuccess());

  }

  isExist(FavouriteMovieModel movie)
  async{
    List<FavouriteMovieModel> movieBox =await Hive.box<FavouriteMovieModel>(kFavouriteMovies).values.toList();
    for(int i=0;i<movieBox.length;i++)
      {
        if (movie.id == movieBox[i].id) {
          emit(AddMovieExists(true));
        }
      }

  }

  deleteMovie(FavouriteMovieModel movie)
  {
    movie.delete();
    emit(AddMovieDelete());

  }
}
