import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/api_services.dart';
import 'package:movies_app/features/categories/data/models/CategoryModel.dart';
import 'package:movies_app/features/categories/data/repo/category_implementation.dart';
import 'package:movies_app/features/categories/data/repo/category_repo.dart';
import 'package:movies_app/features/categories/presentation/view_model/cubits/get_movies_by_category/get_movies_by_category_cubit.dart';
import 'package:movies_app/features/home/data/models/movie_model/MovieModel.dart';
import 'package:movies_app/features/home/data/repos/home_implementation.dart';
import 'package:movies_app/features/home/presentation/view/widgets/movie_details_date.dart';
import 'package:movies_app/features/home/presentation/view_model/cubits/new_releases_movies/new_releases_cubit.dart';
import 'package:movies_app/features/home/presentation/view_model/cubits/popular_movies/popular_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/view_model/cubits/top_rated_movies/top_rated_movies_cubit.dart';
import 'package:movies_app/features/movie_details/data/models/movie_detail_model/MovieDetailModel.dart';
import 'package:movies_app/features/movie_details/data/movie_detail_repo/movie_detail_imlementation.dart';
import 'package:movies_app/features/movie_details/data/movie_detail_repo/related_movies/related_movies_implementation.dart';
import 'package:movies_app/features/movie_details/presentation/view/movie_detail_view.dart';
import 'package:movies_app/features/movie_details/presentation/view_model/cubits/related_movies/related_movies_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/view_model/movie_detail_cubit.dart';
import '../../features/categories/presentation/view/single_category_view.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/splash/presentation/view/splash_view.dart';

abstract class AppRoutes {
  static const String kHomeView = '/homeView';
  static const String kMovieDetailsView = '/movieDetailsView';
  static const String kSingleCategoryView = '/singleCategoryView';

  // GoRouter configuration
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) =>
                PopularMoviesCubit(HomeImplementation(ApiService(Dio()))),
          ),
          BlocProvider(
            create: (context) =>
                NewReleasesCubit(HomeImplementation(ApiService(Dio()))),
          ),
          BlocProvider(
            create: (context) =>
                TopRatedMoviesCubit(HomeImplementation(ApiService(Dio()))),
          ),
        ], child: const HomeView()),
      ),
      GoRoute(
        path: kMovieDetailsView,
        builder: (context, state) => MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) =>
                MovieDetailCubit(MovieDetailImplementation(ApiService(Dio()))),
          ),
          BlocProvider(
            create: (context) => RelatedMoviesCubit(
                RelatedMoviesImplementation(ApiService(Dio()))),
          ),
        ], child: MovieDetailView(movieId: state.extra as int),),
      ),
      GoRoute(
        path: kSingleCategoryView,
        builder: (context, state) => BlocProvider(
          create: (context) => GetMoviesByCategoryCubit(
              CategoryImplementation(ApiService(Dio()))),
          child: SingleCategoryView(state.extra as CategoryModel),
        ),
      ),
    ],
  );
}
