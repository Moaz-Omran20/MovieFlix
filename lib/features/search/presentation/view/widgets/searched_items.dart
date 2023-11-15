import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/shared.dart';
import 'package:movies_app/features/home/data/models/movie_model/MovieModel.dart';
import 'package:movies_app/features/home/presentation/view/widgets/rating_item.dart';

import '../../../../../core/utils/app_images.dart';

class SearchedItems extends StatelessWidget {
  MovieModel searchedMovie;

  SearchedItems(this.searchedMovie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 100,
            width: 150,
            child: CachedNetworkImage(
              imageUrl:
                  "https://image.tmdb.org/t/p/w500${searchedMovie.backdropPath}",
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => const LoadingIndicator(),
              placeholder: (context, url) => const LoadingIndicator(),
            )),
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
                searchedMovie.title??"Unknown",
                style: GoogleFonts.rubik(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              searchedMovie.releaseDate.toString(),
              style: GoogleFonts.rubik(fontSize: 12,color: Colors.grey),
            ),
            const SizedBox(
              height: 3,
            ),
            RatingItem(movieRate: searchedMovie.voteAverage,),
          ],
        )
      ],
    );
  }
}
