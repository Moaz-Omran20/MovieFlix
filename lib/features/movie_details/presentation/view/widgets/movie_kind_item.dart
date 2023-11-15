import 'package:flutter/material.dart';

import '../../../data/models/movie_detail_model/MovieDetailModel.dart';

class MovieKindItem extends StatelessWidget {


  MovieDetailModel movieDetails;
  int index;


  MovieKindItem(this.movieDetails, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 70,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white),
          color: Colors.transparent,
        ),
        child: Center(child: Text(movieDetails.genres![index].name!, style:TextStyle(fontSize: 12,)),
      ),
    ));
  }
}
