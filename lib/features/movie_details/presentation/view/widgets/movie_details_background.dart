import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/shared.dart';
import '../../../data/models/movie_detail_model/MovieDetailModel.dart';

class MovieDetailsBackground extends StatelessWidget {
  MovieDetailModel movieDetails;

  MovieDetailsBackground(this.movieDetails, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .28,
        child: CachedNetworkImage(
          errorWidget: (context, url, error) =>  const ErrorImageWidget(),
            placeholder: (context, url) => const Center(
                child: LoadingIndicator()),
            imageUrl:
                "https://image.tmdb.org/t/p/w500${movieDetails.backdropPath}"));
  }
}
