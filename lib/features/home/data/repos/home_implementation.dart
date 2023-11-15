import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/core/utils/api_services.dart';
import 'package:movies_app/features/home/data/models/movie_model/MovieModel.dart';
import 'package:movies_app/features/home/data/models/popular_model/PopularModel.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';

import '../../../../core/failures/failures.dart';
import '../models/new_releases_model/NewReleasesModel.dart';
import '../models/top_rated_movies/TopRatedModel.dart';

class HomeImplementation implements HomeRepo
{

  final ApiService apiService;


  HomeImplementation(this.apiService);

  @override
  Future<Either<Failure,List<MovieModel>>>fetchMoviesNewReleases() async{
    try {
      var data = await apiService.get(
          endpoint:
          "upcoming?language=en-US&page=2&api_key=$apiKey");
      List<MovieModel> newReleasesMovies = [];
      for (var item in data["results"]) {
        newReleasesMovies.add(MovieModel.fromJson(item));
      }
      return right(newReleasesMovies);
    } on Exception catch (e) {
      if(e is DioException)
      {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("Unexpected error ,please try again later"));

    }
  }

  @override
  Future<Either<Failure,List<MovieModel>>>fetchMoviesPopular()async {
    try {
      var data = await apiService.get(
          endpoint:
          "popular?api_key=$apiKey");
      List<MovieModel> popularMovies = [];
      for (var item in data["results"]) {
        popularMovies.add(MovieModel.fromJson(item));
      }
      return right(popularMovies);
    } on Exception catch (e) {
      if(e is DioException)
      {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("Unexpected error ,please try again later"));

    }

  }

  @override
  Future<Either<Failure,List<MovieModel>>>fetchMoviesTopRated() async{

    try {
      var data = await apiService.get(
          endpoint:
          "top_rated?language=en-US&page=1&api_key=$apiKey");
      List<MovieModel> topRatedMovies = [];
      for (var item in data["results"]) {
        topRatedMovies.add(MovieModel.fromJson(item));
      }
      return right(topRatedMovies);
    } on Exception catch (e) {
      if(e is DioException)
      {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("Unexpected error ,please try again later"));

    }
  }


}