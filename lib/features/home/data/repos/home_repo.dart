import 'package:dartz/dartz.dart';
import '../../../../core/failures/failures.dart';
import '../models/movie_model/MovieModel.dart';

abstract class HomeRepo
{
  Future<Either<Failure,List<MovieModel>>>fetchMoviesPopular();
  Future<Either<Failure,List<MovieModel>>>fetchMoviesNewReleases();
  Future<Either<Failure,List<MovieModel>>>fetchMoviesTopRated();



}