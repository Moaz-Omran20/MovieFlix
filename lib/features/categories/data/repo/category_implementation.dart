import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/core/utils/api_services.dart';
import 'package:movies_app/features/categories/data/models/CategoryModel.dart';
import 'package:movies_app/features/categories/data/repo/category_repo.dart';
import 'package:movies_app/features/home/data/models/movie_model/MovieModel.dart';

import '../../../../constants.dart';

class CategoryImplementation implements CategoryRepo {
  ApiService apiService;

  CategoryImplementation(this.apiService);

  @override
  Future<Either<Failure, List<CategoryModel>>> fetchCategories() async {
    try {
      var data = await apiService.getCategories(
          endpoint: "list?language=en&api_key=$apiKey");
      List<CategoryModel> categories = [];
      for (var item in data["genres"]) {
        categories.add(CategoryModel.fromJson(item));
      }
      return right(categories);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("Unexpected error ,please try again later"));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchMoviesByCategory(
      {required num id}) async {
    try {
      var data = await apiService.getMoviesByCategory(
          endpoint:
              "?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_genres=$id&api_key=$apiKey");
      List<MovieModel> movies = [];
      for (var item in data["results"]) {
        movies.add(MovieModel.fromJson(item));
      }
      return right(movies);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("Unexpected error ,please try again later"));
    }
  }
}
