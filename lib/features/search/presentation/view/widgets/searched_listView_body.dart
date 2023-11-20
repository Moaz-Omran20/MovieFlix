import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/shared.dart';
import 'package:movies_app/features/search/presentation/view/widgets/searched_items.dart';
import 'package:movies_app/features/search/presentation/view_model/cubits/search_cubit/search_cubit.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_routes.dart';

class SearchedListViewBody extends StatelessWidget {
  const SearchedListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.kMovieDetailsView,
                          extra: state.searchedMovies[index].id);
                    },
                    child: SearchedItems(state.searchedMovies[index]));
              },
              itemCount: state.searchedMovies.length,
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 2,
                );
              },
              physics: const BouncingScrollPhysics(),
            ),
          );
        } else if (state is SearchFailure) {
          return Text(state.errMessage);
        } else if (state is SearchInitial) {
          return Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Center(
              child: Image.asset(
                AppImages.noResults,
                height: 100,
              ),
            ),
          );
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
