import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/favourite_movie_model.dart';
import 'package:movies_app/core/utils/shared.dart';
import 'package:movies_app/features/home/presentation/view/widgets/rating_item.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/movie_details_kinds.dart';
import '../../../../../constants.dart';
import '../../../../watch_list/presentation/view_model/cubits/add_movie_cubit.dart';
import '../../../data/models/movie_detail_model/MovieDetailModel.dart';

class MovieDetailsViewFullDetails extends StatefulWidget {
 final MovieDetailModel movieDetails;
  bool selected = false;
 FavouriteMovieModel? favouriteMovieModel ;


 MovieDetailsViewFullDetails(this.movieDetails, {super.key});

  @override
  State<MovieDetailsViewFullDetails> createState() =>
      _MovieDetailsViewFullDetailsState();
}

class _MovieDetailsViewFullDetailsState
    extends State<MovieDetailsViewFullDetails> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: Row(
        children: [
          Stack(
            children: [
              SizedBox(
                width: 129,
                height: 199,
                child: CachedNetworkImage(
                  placeholder: (context, url) => const LoadingIndicator(),
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) => const LoadingIndicator(),
                  imageUrl:
                  "https://image.tmdb.org/t/p/w500${widget.movieDetails.posterPath}",
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
                          FavouriteMovieModel(id: widget.movieDetails.id!,
                              backdropPath: widget.movieDetails.backdropPath ??
                                  "",
                              title: widget.movieDetails.title ?? "",
                              date: widget.movieDetails.releaseDate ?? "",
                              rating: widget.movieDetails.voteAverage ?? 0);
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
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14),
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
                  width: MediaQuery.of(context).size.width * .50,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 10,
                    widget.movieDetails.overview ?? "",
                    style: GoogleFonts.rubik(fontSize: 10),
                  ),
                ),
                RatingItem(
                    movieRate: widget.movieDetails.voteAverage),
              ],
            ),
          )
        ],
      ),
    );
  }
}
