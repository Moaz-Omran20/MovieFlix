import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/favourite_movie_model.dart';
import 'package:movies_app/core/utils/shared.dart';
import 'package:movies_app/features/home/presentation/view/widgets/rating_item.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/movie_details_kinds.dart';
import '../../../../watch_list/presentation/view_model/cubits/watchlist/watch_list_cubit.dart';
import '../../../data/models/movie_detail_model/MovieDetailModel.dart';

class MovieDetailsViewFullDetails extends StatefulWidget {
  final MovieDetailModel movieDetails;
  FavouriteMovieModel? favouriteMovieModel;

  MovieDetailsViewFullDetails(this.movieDetails, {super.key});

  @override
  State<MovieDetailsViewFullDetails> createState() =>
      _MovieDetailsViewFullDetailsState();
}

class _MovieDetailsViewFullDetailsState
    extends State<MovieDetailsViewFullDetails> {
  @override
  Widget build(BuildContext context) {
    var watchListCubit = BlocProvider.of<WatchListCubit>(context, listen: true);
    var isWatchListed =
        watchListCubit.moviesBox.keys.contains(widget.movieDetails.id);

    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      child: Row(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 110),
                child: SizedBox(
                  width: 129,
                  height: 200,
                  child: CachedNetworkImage(
                    placeholder: (context, url) => const LoadingIndicator(),
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => const ErrorImageWidget(),
                    imageUrl:
                        "https://image.tmdb.org/t/p/w500${widget.movieDetails.posterPath}",
                  ),
                ),
              ),
              Positioned(
                top: -8,
                left: -10,
                child: InkWell(
                    onTap: () async {
                      widget.favouriteMovieModel = FavouriteMovieModel(
                          id: widget.movieDetails.id!,
                          backdropPath: widget.movieDetails.backdropPath ?? "",
                          title: widget.movieDetails.title ?? "",
                          date: widget.movieDetails.releaseDate ?? "",
                          rating: widget.movieDetails.voteAverage ?? 0);
                      await watchListCubit.toggleWatchList(
                          widget.movieDetails.id!, widget.favouriteMovieModel!);
                      setState(() {});
                    },
                    child: SizedBox(
                        height: 45,
                        width: 45,
                        child: Image.asset(isWatchListed
                            ? "assets/images/selected.png"
                            : "assets/images/unSelected.png"))),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      MovieDetailsKindsListView(widget.movieDetails),
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .53,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 15,
                      widget.movieDetails.overview ?? "",
                      style: GoogleFonts.rubik(fontSize: 10),
                    ),
                  ),
                  RatingItem(movieRate: widget.movieDetails.voteAverage),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
