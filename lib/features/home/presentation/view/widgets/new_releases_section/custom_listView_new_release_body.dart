import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/favourite_movie_model.dart';
import 'package:movies_app/features/home/presentation/view_model/cubits/new_releases_movies/new_releases_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/view_model/cubits/add_movie_cubit.dart';

import '../../../../../../core/utils/app_routes.dart';
import '../../../../../../core/utils/shared.dart';
import 'new_release_item.dart';

class CustomListViewNewReleaseBody extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewReleasesCubit, NewReleasesState>(
      builder: (context, state) {
        if (state is NewReleasesSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .17,
            width: MediaQuery.of(context).size.width * .93,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 14.7),
                  child: InkWell(
                      onTap: () {
                        GoRouter.of(context).push(AppRoutes.kMovieDetailsView,
                            extra: state.newReleasesMovies[index].id);
                      },
                      child: NewReleaseItem(
                        newReleaseMovieImage:
                            "https://image.tmdb.org/t/p/w500${state.newReleasesMovies[index].posterPath}",
                        newReleaseMovie: state.newReleasesMovies[index]
                      )),
                );
              },
              physics: const BouncingScrollPhysics(),
              itemCount: state.newReleasesMovies.length,
            ),
          );
        } else if (state is NewReleasesFailure) {
          return Text(state.errMessage);
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
