import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/movie_kind_item.dart';

import '../../../data/models/movie_detail_model/MovieDetailModel.dart';

class MovieDetailsKindsListView extends StatelessWidget {

  MovieDetailModel movieDetails;

  MovieDetailsKindsListView(this.movieDetails);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*.45,
      height: 40,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return MovieKindItem(movieDetails,index);
        },
        itemCount: movieDetails.genres!.length,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
