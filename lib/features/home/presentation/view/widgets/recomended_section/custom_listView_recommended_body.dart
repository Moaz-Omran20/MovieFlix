import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/features/home/presentation/view/widgets/recomended_section/recommended_item.dart';
import 'package:movies_app/features/home/presentation/view_model/cubits/top_rated_movies/top_rated_movies_cubit.dart';

import '../../../../../../core/utils/app_routes.dart';
import '../../../../../../core/utils/shared.dart';

class CustomListViewRecommendedBody extends StatelessWidget {
  const CustomListViewRecommendedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
      builder: (context, state) {
        if (state is TopRatedMoviesSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .31,
            width: MediaQuery.of(context).size.width * .93,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 14.7),
                  child: InkWell(
                      onTap: () {
                        GoRouter.of(context).push(AppRoutes.kMovieDetailsView,extra: state.topRatedMovies[index].id);
                      },
                      child: RecommendedItem(
                          topRatedMovie: state.topRatedMovies[index])),
                );
              },
              physics: const BouncingScrollPhysics(),
              itemCount: state.topRatedMovies.length,
            ),
          );
        } else if (state is TopRatedMoviesFailure) {
          return Text(state.errMessage);
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
