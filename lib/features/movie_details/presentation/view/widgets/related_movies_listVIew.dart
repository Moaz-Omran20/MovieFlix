import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/related_movies_item.dart';
import 'package:movies_app/features/movie_details/presentation/view_model/cubits/related_movies/related_movies_cubit.dart';

import '../../../../../core/utils/app_routes.dart';

class RelatedMoviesListView extends StatelessWidget {
  const RelatedMoviesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * .31,
      width: MediaQuery
          .of(context)
          .size
          .width * .93,
      child: BlocBuilder<RelatedMoviesCubit, RelatedMoviesState>(
        builder: (context, state) {
          if (state is RelatedMoviesSuccess) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 14.7),
                  child: InkWell(
                      onTap: () {
                        GoRouter.of(context).push(
                            AppRoutes.kMovieDetailsView, extra: state
                            .relatedMovies[index].id);
                      },
                      child: RelatedMoviesItem(state.relatedMovies[index])),
                );
              },
              physics: const BouncingScrollPhysics(),
              itemCount: state.relatedMovies.length,
            );
          }
          else if (state is RelatedMoviesFailure) {
            return Center(child: Text(state.errMessage));
          }
          else
          {
          return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
