import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/app_routes.dart';
import '../../../data/models/CategoryModel.dart';

class CategoriesItem extends StatelessWidget {
  String categoryImage;
  CategoryModel categoryModel;

  CategoriesItem({super.key, required this.categoryImage, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .push(AppRoutes.kSingleCategoryView, extra: categoryModel);
      },
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(categoryImage), fit: BoxFit.fill,scale: 90)),
        ),
        Center(
          child: Text(
            categoryModel.name ?? "",
            style:
                GoogleFonts.rubik(fontWeight: FontWeight.bold, fontSize: 18,),
          ),
        ),
      ]),
    );
  }
}
