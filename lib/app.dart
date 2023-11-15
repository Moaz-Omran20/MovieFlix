import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/watch_list/presentation/view_model/cubits/add_movie_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/view_model/cubits/fetch_movies_cubit/fetch_favourite_movies_cubit.dart';

import 'core/utils/app_routes.dart';


class Movies extends StatelessWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) => AddMovieCubit()),
        BlocProvider(create: (context) => FetchFavouriteMoviesCubit(),),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF121312),
          appBarTheme: const AppBarTheme(color: Color(0xFF101010),),
        ),
      ),
    );
  }
}
