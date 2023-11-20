import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/favourite_movie_model.dart';
import 'package:movies_app/features/home/presentation/view/widgets/rating_item.dart';
import 'package:movies_app/features/watch_list/presentation/view_model/cubits/watchlist/watch_list_cubit.dart';

import '../../../../../core/utils/shared.dart';

class WatchListItem extends StatelessWidget {
  FavouriteMovieModel favouriteMovie;

  num movieId;

  WatchListItem({super.key, required this.favouriteMovie, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
          motion: const StretchMotion(), extentRatio: .3, children: [
        SlidableAction(
          onPressed: (context) {
            favouriteMovie.delete();
            BlocProvider.of<WatchListCubit>(context).removeItemFromDataBase(
                movieId);
          },
          label: "Delete",
          backgroundColor: Colors.red,
          autoClose: true,
          icon: Icons.delete,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
        ),
      ]),
      child: Row(
        children: [
          CachedNetworkImage(
            errorWidget: (context, url, error) => const ErrorImageWidget(),
            imageUrl:
            "https://image.tmdb.org/t/p/w500${favouriteMovie.backdropPath}",
            height: 89,
            width: 140,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery
                        .of(context)
                        .size
                        .width - 200),
                child: Text(
                  favouriteMovie.title ,
                  style: GoogleFonts.rubik(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                favouriteMovie.date.toString(),
                style: GoogleFonts.rubik(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(
                height: 3,
              ),
              RatingItem(movieRate: favouriteMovie.rating)
            ],
          )
        ],
      ),
    );
  }
}
