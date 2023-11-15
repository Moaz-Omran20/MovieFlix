import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_app/features/home/data/models/movie_model/MovieModel.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/favourite_movie_model.dart';
import '../../../../../core/utils/shared.dart';
import '../../../../home/presentation/view/widgets/movie_details_date.dart';
import '../../../../home/presentation/view/widgets/movie_details_title.dart';
import '../../../../home/presentation/view/widgets/rating_item.dart';
import '../../../../watch_list/presentation/view_model/cubits/add_movie_cubit.dart';

class RelatedMoviesItem extends StatefulWidget {
    bool selected =false;
    MovieModel relatedMovie;
    FavouriteMovieModel? favouriteMovieModel;


    RelatedMoviesItem(this.relatedMovie);

  @override
  State<RelatedMoviesItem> createState() => _RelatedMoviesItemState();
}

class _RelatedMoviesItemState extends State<RelatedMoviesItem> {
  @override
  Widget build(BuildContext context) {
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
                  "https://image.tmdb.org/t/p/w500${widget.relatedMovie.posterPath}",
                  errorWidget: (context, url, error) =>
                  const LoadingIndicator(),
                ),
              ),
              Positioned(
                top: -8,
                left: -10,
                child: IconButton(
                  onPressed: () {
                    widget.selected = !widget.selected;
                    setState(() {});
                    if (widget.selected) {
                      widget.favouriteMovieModel =
                          FavouriteMovieModel(id: widget.relatedMovie.id!,
                              backdropPath: widget.relatedMovie.backdropPath ??
                                  "",
                              title: widget.relatedMovie.title ?? "",
                              date: widget.relatedMovie.releaseDate ?? "",
                              rating: widget.relatedMovie.voteAverage ?? 0);
                      BlocProvider.of<AddMovieCubit>(context).addMovie(
                          widget.favouriteMovieModel!);
                      print("Added Successfully");
                    }
                  },
                  icon: Icon(
                    size: 32,
                    FontAwesomeIcons.solidBookmark,
                    color:
                    widget.selected ? kPrimaryColor : kBookMarkIconColorUnselected,
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: RatingItem(
                  movieRate: widget.relatedMovie.voteAverage),
            ),
            const SizedBox(
              height: 3,
            ),
            MovieDetailsTitle(title: widget.relatedMovie.title??"Unknown"),
            const SizedBox(
              height: 10,
            ),
            MovieDetailsDate(date: widget.relatedMovie.releaseDate.toString()),
          ],
        ),
      ),
    );
  }
}
