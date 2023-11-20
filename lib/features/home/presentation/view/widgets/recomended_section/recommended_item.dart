import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/view/widgets/movie_details_title.dart';
import 'package:movies_app/features/home/presentation/view/widgets/movie_details_date.dart';
import '../../../../../../core/utils/favourite_movie_model.dart';
import '../../../../../../core/utils/shared.dart';
import '../../../../../watch_list/presentation/view_model/cubits/watchlist/watch_list_cubit.dart';
import '../../../../data/models/movie_model/MovieModel.dart';
import '../rating_item.dart';

class RecommendedItem extends StatefulWidget {
  MovieModel topRatedMovie;
  FavouriteMovieModel? favouriteMovieModel;

  RecommendedItem({super.key, required this.topRatedMovie});

  @override
  State<RecommendedItem> createState() => _RecommendedItemState();
}

class _RecommendedItemState extends State<RecommendedItem> {
  @override
  Widget build(BuildContext context) {
    var watchListCubit = BlocProvider.of<WatchListCubit>(context, listen: true);
    var isWatchListed = watchListCubit.moviesBox.keys.contains(
        widget.topRatedMovie.id);
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
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  placeholder: (context, url) => const LoadingIndicator(),
                  imageUrl:
                  "https://image.tmdb.org/t/p/w500${widget.topRatedMovie
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
                    widget.favouriteMovieModel = FavouriteMovieModel(id: widget.topRatedMovie.id!,
                        backdropPath: widget.topRatedMovie.backdropPath??"",
                        title: widget.topRatedMovie.title??"",
                        date: widget.topRatedMovie.releaseDate??"",
                        rating: widget.topRatedMovie.voteAverage??0);
                    watchListCubit.toggleWatchList(
                        widget.topRatedMovie.id!, widget.favouriteMovieModel!);
                  },
                  child: SizedBox(
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
                  movieRate: widget.topRatedMovie.voteAverage),
            ),
            const SizedBox(
              height: 3,
            ),
            MovieDetailsTitle(
                title: widget.topRatedMovie.title ?? "Empty title"),
            const SizedBox(
              height: 10,
            ),
            MovieDetailsDate(date: widget.topRatedMovie.releaseDate ??
                "Unknown release date"),
          ],
        ),
      ),
    );
  }
}
