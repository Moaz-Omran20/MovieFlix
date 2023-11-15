import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_carousel_slider.dart';
import 'package:movies_app/features/home/presentation/view/widgets/new_releases_section/new_releases_section.dart';
import 'package:movies_app/features/home/presentation/view/widgets/recomended_section/recomended_section.dart';
import 'package:movies_app/features/home/presentation/view_model/cubits/new_releases_movies/new_releases_cubit.dart';
import 'package:movies_app/features/home/presentation/view_model/cubits/popular_movies/popular_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/view_model/cubits/top_rated_movies/top_rated_movies_cubit.dart';

class HomeNavBarView extends StatefulWidget {
  const HomeNavBarView({super.key});

  @override
  State<HomeNavBarView> createState() => _HomeNavBarViewState();
}

class _HomeNavBarViewState extends State<HomeNavBarView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<PopularMoviesCubit>(context).fetchPopularMovies();
    BlocProvider.of<NewReleasesCubit>(context).fetchNewReleasesMovies();
    BlocProvider.of<TopRatedMoviesCubit>(context).fetchTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: CustomCarouselSLider(),
          ),
          const SizedBox(
            height: 24,
          ),
          const NewReleasesSection(),
          const SizedBox(
            height: 30,
          ),
          RecommendedSection(title: "Recommended"),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
