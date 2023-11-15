import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/features/home/presentation/view/widgets/carousel_slider_item.dart';
import 'package:movies_app/features/home/presentation/view_model/cubits/popular_movies/popular_movies_cubit.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/shared.dart';

class CustomCarouselSLider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
      builder: (context, state) {
        if (state is PopularMoviesSuccess) {
          return CarouselSlider.builder(
            itemCount: state.popularMovies.length,
            itemBuilder: (context, index, realIndex) {
              return InkWell(
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.kMovieDetailsView,
                      extra: state.popularMovies[index].id);
                },
                child: CarouselSliderItem(
                    "https://image.tmdb.org/t/p/w500${state.popularMovies[index].backdropPath}",
                    state.popularMovies[index].title ?? ""),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              height: 200,
              autoPlayAnimationDuration: const Duration(seconds: 1),
            ),
          );
        } else if (state is PopularMoviesFailure) {
          return Text(state.errMessage);
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
