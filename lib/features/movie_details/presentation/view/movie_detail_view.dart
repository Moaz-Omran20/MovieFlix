import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/features/home/data/models/movie_model/MovieModel.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/movie_detail_view_body.dart';
import 'package:movies_app/features/movie_details/presentation/view_model/cubits/related_movies/related_movies_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/view_model/movie_detail_cubit.dart';

import '../../../../core/utils/shared.dart';

class MovieDetailView extends StatefulWidget {
   int movieId;


  MovieDetailView({required this.movieId});

  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MovieDetailCubit>(context)
        .fetchMovieDetail(id: widget.movieId);
    BlocProvider.of<RelatedMoviesCubit>(context).fetchRelatedMovies(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      builder: (context, state) {
        if (state is MovieDetailSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.movieDetail.title ?? "Unknown"),
              titleTextStyle: GoogleFonts.rubik(fontSize: 18),
            ),
            body: MovieDetailViewBody(state.movieDetail ),
          );
        }
        else if (state is MovieDetailFailure) {
          return  Scaffold(
            body: Center(
                child: Text(state.errMessage)),
          );
        }
        else {
          return const Scaffold(
            body: LoadingIndicator(),
          );
        }
      },
    );
  }
}
