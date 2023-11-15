import 'package:dartz/dartz.dart';
import 'package:movies_app/features/home/data/models/new_releases_model/NewReleasesModel.dart';
import 'package:movies_app/features/home/data/models/popular_model/PopularModel.dart';
import 'package:movies_app/features/home/data/models/top_rated_movies/TopRatedModel.dart';

import '../../../../core/failures/failures.dart';
import '../models/movie_model/MovieModel.dart';

abstract class HomeRepo
{
  Future<Either<Failure,List<MovieModel>>>fetchMoviesPopular();
  Future<Either<Failure,List<MovieModel>>>fetchMoviesNewReleases();
  Future<Either<Failure,List<MovieModel>>>fetchMoviesTopRated();



}