import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/core/utils/shared.dart';
import 'package:movies_app/features/movie_details/data/models/top_cast_model/TopCastModel.dart';

import '../../../../home/presentation/view/widgets/movie_details_title.dart';

class TopCastItem extends StatelessWidget {

  TopCastModel topCast;

  TopCastItem(this.topCast, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFF343534), borderRadius: BorderRadius.circular(12)),
      width: MediaQuery.of(context).size.width*.25,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*.18,
              child: CachedNetworkImage(
                placeholder: (context, url) => const LoadingIndicator(),
                errorWidget: (context, url, error) => const ErrorImageWidget(),
                  imageUrl:
                      "https://image.tmdb.org/t/p/w500${topCast.profilePath}",
                  fit: BoxFit.fill),
            ),
            const SizedBox(
              height: 5,
            ),
            MovieDetailsTitle(title: topCast.name??"Unknown"),
            const SizedBox(
              height: 5,
            ),
            Text(topCast.character??"Unknown",style: const TextStyle(color:Colors.grey),),
          ],
        ),
      ),
    );
  }
}
