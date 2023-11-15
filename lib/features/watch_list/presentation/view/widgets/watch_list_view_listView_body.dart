import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/app_routes.dart';
import 'package:movies_app/core/utils/shared.dart';
import 'package:movies_app/features/home/data/models/movie_model/MovieModel.dart';
import 'package:movies_app/features/watch_list/presentation/view/widgets/watch_list_item.dart';
import 'package:movies_app/features/watch_list/presentation/view_model/cubits/add_movie_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/view_model/cubits/fetch_movies_cubit/fetch_favourite_movies_cubit.dart';

class WatchListViewListViewBody extends StatefulWidget {
  const WatchListViewListViewBody({Key? key}) : super(key: key);

  @override
  State<WatchListViewListViewBody> createState() =>
      _WatchListViewListViewBodyState();
}

class _WatchListViewListViewBodyState extends State<WatchListViewListViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<FetchFavouriteMoviesCubit>(context).fetchFavouriteMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddMovieCubit, AddMovieState>(
      listener: (context, state) {
        if (state is AddMovieSuccess) {
          BlocProvider.of<FetchFavouriteMoviesCubit>(context)
              .fetchFavouriteMovies();
        }
      },

      builder: (context, state) {
        if (state is AddMovieSuccess) {
          return BlocBuilder<FetchFavouriteMoviesCubit,
              FetchFavouriteMoviesState>(
            builder: (context, state) {
              if (state is FetchFavouriteMoviesSuccess) {
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            GoRouter.of(context).push(
                                AppRoutes.kMovieDetailsView,
                                extra: state.favouriteMovies[index].id);
                          },
                          child: WatchListItem(
                              favouriteMovie: state.favouriteMovies[index]));
                    },
                    itemCount: state.favouriteMovies.length,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 2,
                      );
                    },
                    physics: const BouncingScrollPhysics(),
                  ),
                );
              } else {
                return Center(child: Text("Error 404"));
              }
            },
          );
        } return Text("  ");
      },
    );
  }
}
