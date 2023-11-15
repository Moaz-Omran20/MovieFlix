import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/features/home/data/models/movie_model/MovieModel.dart';
import 'package:movies_app/features/home/presentation/view/widgets/rating_item.dart';

class MovieByCategoryItem extends StatelessWidget {
  MovieModel movieModel;

  MovieByCategoryItem(this.movieModel);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: CachedNetworkImage(
            imageUrl:
                "https://image.tmdb.org/t/p/w500${movieModel.backdropPath}",
            errorWidget: (context, url, error) => Icon(Icons.error),
            height: 89,
            width: 140,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 200),
              child: Text(
                movieModel.title ?? "unKnown",
                style: GoogleFonts.rubik(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              movieModel.releaseDate.toString(),
              style: GoogleFonts.rubik(fontSize: 12,color: Colors.grey),
            ),
            const SizedBox(
              height: 3,
            ),
            RatingItem(movieRate: movieModel.voteAverage,),
          ],
        )
      ],
    );
    ;
  }
}
