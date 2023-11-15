import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/core/utils/api_services.dart';
import 'package:movies_app/features/home/data/models/movie_model/MovieModel.dart';
import 'package:movies_app/features/search/data/repo/search_repo.dart';

import '../../../../constants.dart';

class SearchImplementation implements SearchRepo
{

  ApiService apiService;

  SearchImplementation(this.apiService);

  @override
  Future<Either<Failure, List<MovieModel>>> fetchSearchedMovies(
      {required String name}) async{
    try {
      var data = await apiService.getSearchedMovie(
          endpoint:
          "?query=$name&include_adult=false&language=en-US&page=1&api_key=$apiKey");
      List<MovieModel> searchedMovies = [];
      for (var item in data["results"]) {
        searchedMovies.add(MovieModel.fromJson(item));
      }
      return right(searchedMovies);
    } on Exception catch (e) {
      if(e is DioException)
      {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("Unexpected error ,please try again later"));

    }

  }




}