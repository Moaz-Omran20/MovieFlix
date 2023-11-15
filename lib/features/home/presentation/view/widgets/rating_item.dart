import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class RatingItem extends StatelessWidget {

  num? movieRate;


  RatingItem({super.key, this.movieRate});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Icon(
          Icons.star,
          size: 20,
          color: kPrimaryColor,
        ),
        Text(
          movieRate!.toStringAsFixed(1),
        ),
      ],
    );
  }
}
