import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_app/core/utils/favourite_movie_model.dart';
import 'package:movies_app/features/home/data/models/movie_model/MovieModel.dart';
import 'package:movies_app/features/watch_list/presentation/view_model/cubits/add_movie_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/view_model/cubits/fetch_movies_cubit/fetch_favourite_movies_cubit.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/utils/shared.dart';

class NewReleaseItem extends StatefulWidget {
  @override
  State<NewReleaseItem> createState() => _NewReleaseItemState();

  final String newReleaseMovieImage;
  final MovieModel newReleaseMovie;
  FavouriteMovieModel? favouriteMovieModel;
  bool selected = false;

  NewReleaseItem({super.key,
    required this.newReleaseMovieImage,
    required this.newReleaseMovie});
}

class _NewReleaseItemState extends State<NewReleaseItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: 100,
        height: 130,
        child: Stack(children: [
          CachedNetworkImage(
              placeholder: (context, url) => const LoadingIndicator(),
              errorWidget: (context, url, error) => const LoadingIndicator(),
              imageUrl: widget.newReleaseMovieImage,
              fit: BoxFit.fill),
          Positioned(
            top: -8,
            left: -10,
            child: IconButton(
              onPressed: () {
                widget.selected = !widget.selected;
                if (widget.selected) {
                  widget.favouriteMovieModel = FavouriteMovieModel(
                      id: widget.newReleaseMovie.id!,
                      backdropPath: widget.newReleaseMovie.backdropPath ?? "",
                      title: widget.newReleaseMovie.title ?? "",
                      date: widget.newReleaseMovie.releaseDate ?? "",
                      rating: widget.newReleaseMovie.voteAverage ?? 0);
                  BlocProvider.of<AddMovieCubit>(context)
                      .addMovie(widget.favouriteMovieModel!);
                  setState(() {

                  });
                  print("Added Successfully");
                }
                else {
                  widget.selected == false;
                  setState(() {
                  });
                }
              },
              icon: Icon(
                size: 32,
                FontAwesomeIcons.solidBookmark,
                color: widget.selected ? kPrimaryColor : Colors.grey,
              ),

              // icon: BlocConsumer<AddMovieCubit, AddMovieState>(
              //   listener:  (context, state) {
              //     if(State is AddMovieExists)
              //       {
              //         widget.selected = true;
              //       }
              //   },
              //   builder: (context, state) {
              //     return Icon(
              //       size: 32,
              //       FontAwesomeIcons.solidBookmark,
              //       color: widget.selected
              //           ? kPrimaryColor
              //           : kBookMarkIconColorUnselected,
              //     );
              //   },
              // ),
            ),
          ),
        ]),
      ),
    ]);
  }
}
