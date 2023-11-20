import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/features/categories/data/models/CategoryModel.dart';
import 'package:movies_app/features/categories/presentation/view/widgets/single_category_view_body.dart';
import 'package:movies_app/features/categories/presentation/view_model/cubits/get_movies_by_category/get_movies_by_category_cubit.dart';

class SingleCategoryView extends StatefulWidget {

  CategoryModel categoryModel;


  SingleCategoryView(this.categoryModel, {super.key});

  @override
  State<SingleCategoryView> createState() => _SingleCategoryViewState();
}

class _SingleCategoryViewState extends State<SingleCategoryView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<GetMoviesByCategoryCubit>(context).getMoviesByCategory(id: widget.categoryModel.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryModel.name??"",
          style: GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: const SingleCategoryViewBody(),
    );
  }
}
