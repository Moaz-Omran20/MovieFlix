import 'package:dio/dio.dart';

class ApiService
{

  final baseUrl = "https://api.themoviedb.org/3/movie/";
  final searchUrl="https://api.themoviedb.org/3/search/movie";
  final categoriesUrl="https://api.themoviedb.org/3/genre/movie/";
  final moviesByCategoriesId="https://api.themoviedb.org/3/discover/movie";
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String,dynamic>> get({required String endpoint})
  async {

    var response = await dio.get("$baseUrl$endpoint");
    return response.data ;
  }
  Future<Map<String,dynamic>> getSearchedMovie({required String endpoint})
  async {

    var response = await dio.get("$searchUrl$endpoint");
    return response.data ;
  }

  Future<Map<String,dynamic>> getCategories({required String endpoint})
  async {

    var response = await dio.get("$categoriesUrl$endpoint");
    return response.data ;
  }
  Future<Map<String,dynamic>> getMoviesByCategory({required String endpoint})
  async {

    var response = await dio.get("$moviesByCategoriesId$endpoint");
    return response.data ;
  }

}