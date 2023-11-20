import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/data/models/movie_model/MovieModel.dart';
import '../../../../../core/utils/favourite_movie_model.dart';
import '../../../../../core/utils/shared.dart';
import '../../../../home/presentation/view/widgets/movie_details_date.dart';
import '../../../../home/presentation/view/widgets/movie_details_title.dart';
import '../../../../home/presentation/view/widgets/rating_item.dart';
import '../../../../watch_list/presentation/view_model/cubits/watchlist/watch_list_cubit.dart';

class RelatedMoviesItem extends StatelessWidget {
  MovieModel relatedMovie;
  FavouriteMovieModel? favouriteMovieModel;


  RelatedMoviesItem(this.relatedMovie, {super.key});

  @override
  Widget build(BuildContext context) {
    var watchListCubit = BlocProvider.of<WatchListCubit>(context, listen: true);
    var isWatchListed = watchListCubit.moviesBox.keys.contains(
        relatedMovie.id);
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFF343534),
          borderRadius: BorderRadius.circular(12)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              SizedBox(
                width: 100,
                height: 130,
                child:
                CachedNetworkImage(
                  fit: BoxFit.fill,
                  placeholder: (context, url) => const LoadingIndicator(),
                  imageUrl:
                  "https://image.tmdb.org/t/p/w500${relatedMovie
                      .posterPath}",
                  errorWidget: (context, url, error) =>
                   const ErrorImageWidget(),
                ),
              ),
              Positioned(
                top: -8,
                left: -10,
                child: InkWell(
                  onTap: () {
                    favouriteMovieModel = FavouriteMovieModel(id: relatedMovie.id!,
                        backdropPath: relatedMovie.backdropPath??"",
                        title: relatedMovie.title??"",
                        date: relatedMovie.releaseDate??"",
                        rating: relatedMovie.voteAverage??0);
                    watchListCubit.toggleWatchList(
                        relatedMovie.id!, favouriteMovieModel!);
                    watchListCubit.watchListMoviesList();
                  },
                  child:SizedBox(
                      height: 45,
                      width: 45,
                      child: Image.asset(isWatchListed?"assets/images/selected.png":"assets/images/unSelected.png")),
                ),
              ),
            ]),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: RatingItem(
                  movieRate: relatedMovie.voteAverage),
            ),
            const SizedBox(
              height: 3,
            ),
            MovieDetailsTitle(title: relatedMovie.title ?? "Unknown"),
            const SizedBox(
              height: 10,
            ),
            MovieDetailsDate(date: relatedMovie.releaseDate.toString()),
          ],
        ),
      ),
    );
  }
}
