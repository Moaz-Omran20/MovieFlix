import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/api_services.dart';
import 'package:movies_app/features/movie_details/data/models/movie_detail_model/MovieDetailModel.dart';
import '../../../../constants.dart';
import '../../../../core/failures/failures.dart';
import '../models/top_cast_model/TopCastModel.dart';
import 'movie_detail_repo.dart';

class MovieDetailImplementation implements MovieDetailRepo {
  ApiService apiService;

  MovieDetailImplementation(this.apiService);

  @override
  Future<MovieDetailModel> fetchMovieDetails({required num id}) async {
    try {
      var data =
          await apiService.get(endpoint: "$id?language=en-US&api_key=$apiKey");
      var movieDetail = MovieDetailModel.fromJson(data);
      return movieDetail;
    } on Exception catch (e) {
      throw "unExpected Error";
    }
  }

  @override
  Future<Either<Failure,List<TopCastModel>>> fetchMovieTopCasts({required num id}) async{
    try {
      var data = await apiService.get(
          endpoint: "$id/credits?language=en-US&api_key=$apiKey");
      List<TopCastModel> relatedMovies = [];
      for (var item in data["cast"]) {
        relatedMovies.add(TopCastModel.fromJson(item));
      }
      return right(relatedMovies);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("Unexpected error ,please try again later"));
    }
  }
}
