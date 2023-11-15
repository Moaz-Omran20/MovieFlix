import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/core/utils/api_services.dart';
import 'package:movies_app/features/movie_details/data/models/movie_detail_model/MovieDetailModel.dart';

import '../../../../constants.dart';
import 'movie_detail_repo.dart';

class MovieDetailImplementation implements MovieDetailRepo {
  ApiService apiService;

  MovieDetailImplementation(this.apiService);

  @override
  Future<MovieDetailModel> fetchMovieDetails({required num id}) async {
    try {
      var data = await apiService.get(
          endpoint: "$id?language=en-US&api_key=$apiKey");
      var movieDetail = MovieDetailModel.fromJson(data);
      return movieDetail;
    } on Exception catch (e) {
      throw "unExpected Error";
    }
  }
}
