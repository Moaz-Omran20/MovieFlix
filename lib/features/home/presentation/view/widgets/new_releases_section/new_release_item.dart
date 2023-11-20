import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/favourite_movie_model.dart';
import 'package:movies_app/features/home/data/models/movie_model/MovieModel.dart';
import 'package:movies_app/features/watch_list/presentation/view_model/cubits/watchlist/watch_list_cubit.dart';
import '../../../../../../core/utils/shared.dart';

class NewReleaseItem extends StatefulWidget {
  @override
  State<NewReleaseItem> createState() => _NewReleaseItemState();

  final String newReleaseMovieImage;
  final MovieModel newReleaseMovie;
  FavouriteMovieModel? favouriteMovieModel;

  NewReleaseItem(
      {super.key,
      required this.newReleaseMovieImage,
      required this.newReleaseMovie});
}

class _NewReleaseItemState extends State<NewReleaseItem> {
  @override
  Widget build(BuildContext context) {
    var watchListCubit = BlocProvider.of<WatchListCubit>(context, listen: true);
    var isWatchListed =
        watchListCubit.moviesBox.keys.contains(widget.newReleaseMovie.id);
    return Stack(children: [
      SizedBox(
        width: 100,
        height: MediaQuery.of(context).size.height*.17,
        child: Stack(children: [
          CachedNetworkImage(
              placeholder: (context, url) => const LoadingIndicator(),
              errorWidget: (context, url, error) =>  const ErrorImageWidget(),
              imageUrl: widget.newReleaseMovieImage,
              fit: BoxFit.fill),
          Positioned(
            top: -8,
            left: -10,
            child: InkWell(
              onTap: () {
                widget.favouriteMovieModel = FavouriteMovieModel(
                    id: widget.newReleaseMovie.id!,
                    backdropPath: widget.newReleaseMovie.backdropPath ?? "",
                    title: widget.newReleaseMovie.title ?? "Unknown",
                    date: widget.newReleaseMovie.releaseDate ?? "Unknown",
                    rating: widget.newReleaseMovie.voteAverage ?? 0);
                watchListCubit.toggleWatchList(
                    widget.newReleaseMovie.id!, widget.favouriteMovieModel!);
              },
              child: SizedBox(
                  height: 45,
                  width: 45,
                  child: Image.asset(isWatchListed?"assets/images/selected.png":"assets/images/unSelected.png")),
            ),
          ),
        ]),
      ),
    ]);
  }
}
