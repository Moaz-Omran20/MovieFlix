import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/app_routes.dart';
import 'package:movies_app/features/watch_list/presentation/view/widgets/watch_list_item.dart';
import '../../view_model/cubits/watchlist/watch_list_cubit.dart';

class WatchListViewListViewBody extends StatelessWidget {
  const WatchListViewListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var watchListCubit = BlocProvider.of<WatchListCubit>(context, listen: true);

    if (watchListCubit.movies.isNotEmpty) {
      return Expanded(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.kMovieDetailsView,
                      extra: watchListCubit.movies[index].id);
                },
                child: WatchListItem(
                    favouriteMovie: watchListCubit.movies[index],
                    movieId: watchListCubit.movies[index].id));
          },
          itemCount: watchListCubit.movies.length,
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 2,
            );
          },
          physics: const BouncingScrollPhysics(),
        ),
      );
    } else {
      return SizedBox(
        height: MediaQuery.of(context).size.height*.6, child: const Center(child: Text("No Movies")));
    }
  }
}
