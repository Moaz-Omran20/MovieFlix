import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/features/home/data/models/movie_model/MovieModel.dart';
import 'package:movies_app/features/movie_details/data/models/movie_detail_model/MovieDetailModel.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/movie_details_background.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/movie_details_full_details.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/related_movies.dart';

import '../../../../../constants.dart';

class MovieDetailViewBody extends StatelessWidget {

  MovieDetailModel movieDetails;

  MovieDetailViewBody(this.movieDetails);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieDetailsBackground(movieDetails),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Text(
              movieDetails.title??"Unknown",
              style: GoogleFonts.rubik(fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Row(
              children: [

                Text(
                  "Release Date: ${movieDetails.releaseDate??"Unknown"}",
                  style: GoogleFonts.rubik(fontSize: 11,color: Colors.grey),
                ),
                SizedBox(width: 5,),
                Icon(Icons.date_range,size: 15,color: kPrimaryColor,),
              ],
            ),
          ),
          const SizedBox(
            height: 19,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: MovieDetailsViewFullDetails(movieDetails),
          ),
          const SizedBox(
            height: 18,
          ),
          RelatedMovies(title: "More Like this"),
        ],
      ),
    );
  }
}
