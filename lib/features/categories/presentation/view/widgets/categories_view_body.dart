import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/shared.dart';
import 'package:movies_app/features/categories/presentation/view/widgets/categories_item.dart';
import 'package:movies_app/features/categories/presentation/view_model/cubits/get_categories_cubit/get_categories_cubit.dart';

import '../../../../../core/utils/app_images.dart';

class CategoriesViewBody extends StatefulWidget {
  const CategoriesViewBody({super.key});

  @override
  State<CategoriesViewBody> createState() => _CategoriesViewBodyState();
}

class _CategoriesViewBodyState extends State<CategoriesViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<GetCategoriesCubit>(context).getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
      builder: (context, state) {
        if (state is GetCategoriesSuccess) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
            ),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return CategoriesItem(
                  categoryImage: AppImages.categoriesImages[index],categoryModel: state.categories[index],);
            },
            itemCount: AppImages.categoriesImages.length,
          );
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
