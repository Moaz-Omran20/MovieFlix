import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/app_routes.dart';
import 'package:movies_app/core/utils/shared.dart';
import 'package:movies_app/features/categories/presentation/view_model/cubits/get_movies_by_category/get_movies_by_category_cubit.dart';

import '../../../../categories/presentation/view/widgets/movie_by_category_item.dart';

class MoviesByCategoriesListView extends StatelessWidget {
  const MoviesByCategoriesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMoviesByCategoryCubit,GetMoviesByCategoryState>(
      builder: (context, state) {
        if(state is GetMoviesByCategorySuccess)
          {
            return Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(thickness: 2,);
                },
                itemBuilder: (context, index) {
                  return InkWell(onTap: () {
                    GoRouter.of(context).push(AppRoutes.kMovieDetailsView,extra: state.movies[index].id);
                  },child: MovieByCategoryItem(state.movies[index]));
                }, itemCount:state.movies.length, physics: BouncingScrollPhysics(),),
            );
          }
        else if(state is GetMoviesByCategoryFailure)
          {
            return Text(state.errMessage);
          }
        else
          {
            return LoadingIndicator();
          }
      },
    );
  }
}
