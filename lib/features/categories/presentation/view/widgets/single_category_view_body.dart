import 'package:flutter/material.dart';
import 'package:movies_app/features/watch_list/presentation/view/widgets/movies_by_categories_listView.dart';

class SingleCategoryViewBody extends StatelessWidget {
  const SingleCategoryViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MoviesByCategoriesListView(),
      ],
    );
  }
}
