import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/constants.dart';
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
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .06,
            decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.3),
                borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(12) ,bottomRight: Radius.circular(12))),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                title,
                style: GoogleFonts.rubik(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
