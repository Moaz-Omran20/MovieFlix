import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/core/utils/app_images.dart';
import 'package:movies_app/core/utils/app_routes.dart';

import '../../../../../core/utils/shared.dart';

class CarouselSliderItem extends StatelessWidget {
  String slideImage;
  String title;

  CarouselSliderItem(this.slideImage, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
            imageUrl: slideImage,
            errorWidget: (context, url, error) => const LoadingIndicator(),
            placeholder: (context, url) => const LoadingIndicator(),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: GoogleFonts.rubik(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white),
          ),
        ),
      ]),
    );
  }
}
