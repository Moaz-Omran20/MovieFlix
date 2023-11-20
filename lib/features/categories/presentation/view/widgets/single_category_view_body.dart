import 'package:flutter/material.dart';
import 'package:movies_app/features/watch_list/presentation/view/widgets/movies_by_categories_listView.dart';

class SingleCategoryViewBody extends StatelessWidget {
  const SingleCategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MoviesByCategoriesListView(),
      ],
    );
  }
}
