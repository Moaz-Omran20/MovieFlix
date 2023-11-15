import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/app.dart';
import 'package:movies_app/features/home/data/models/movie_model/MovieModel.dart';

import 'constants.dart';
import 'core/utils/favourite_movie_model.dart';

void main()async
{
  // widget.selected = !widget.selected;
  // setState(() {});
  // if(widget.selected)
  // {
  //   BlocProvider.of<AddMovieCubit>(context).addMovie(widget.topRatedMovie);
  //   print("Added Successfully");
  // }

  // startActionPane: ActionPane(motion: const StretchMotion(), children: [
  //   SlidableAction(
  //     onPressed: (context) {
  //       FireBaseFunctions.deleteTask(task.id);
  //     },
  //     label: "Delete",
  //     backgroundColor: Colors.red,
  //     autoClose: true,
  //     icon: Icons.delete,
  //     borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
  //   ),
  //   SlidableAction(
  //     autoClose: true,
  //     onPressed: (context) {},
  //     label: "Edit",
  //     backgroundColor: Colors.blue,
  //     icon: Icons.edit,
  //   ),
  // ]


  // BlocBuilder<MovieFavCubit, MovieFavState>(
  //     builder: (context, state) {
  //   if (state is MovieFavExistsInDb) {
  //     isSelected = true;
  //   } else if (state is MovieFavAddedToDb) {
  //     isSelected = true;
  //   } else if (state is MovieFavRemoveFromDb) {
  //     isSelected = false;
  //   }
  //   return IconButton(
  //       onPressed: () {
  //         HapticFeedback.heavyImpact();
  //         if (isSelected == true) {
  //           BlocProvider.of<MovieFavCubit>(context)
  //               .removeFromDb(movieId: widget.movieDetail.id ?? 0);
  //         } else if (isSelected == false) {
  //           BlocProvider.of<MovieFavCubit>(context).addToDb(
  //               movieId: widget.movieDetail.id ?? 0,
  //               title: widget.movieDetail.title ?? "",
  //               posterPath: widget.movieDetail.posterPath ?? "",
  //               releaseDate: widget.movieDetail.releaseDate ?? "",
  //               voteAverage: widget.movieDetail.voteAverage ?? 0);
  //         }
  //       },


  await Hive.initFlutter();
  Hive.registerAdapter(FavouriteMovieModelAdapter());
  await Hive.openBox<FavouriteMovieModel>(kFavouriteMovies);
  runApp(const Movies());
}


