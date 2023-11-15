import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/core/utils/api_services.dart';
import 'package:movies_app/features/home/data/models/movie_model/MovieModel.dart';
import 'package:movies_app/features/movie_details/data/movie_detail_repo/related_movies/related_movies_repo.dart';

import '../../../../../constants.dart';

class RelatedMoviesImplementation implements RelatedMoviesRepo {
  ApiService apiService;

  RelatedMoviesImplementation(this.apiService);

  @override
  Future<Either<Failure, List<MovieModel>>> fetchRelatedMovies(
      {required num id}) async {
    try {
      var data = await apiService.get(
          endpoint: "$id/similar?language=en-US&page=1&api_key=$apiKey");
      List<MovieModel> relatedMovies = [];
      for (var item in data["results"]) {
        relatedMovies.add(MovieModel.fromJson(item));
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
