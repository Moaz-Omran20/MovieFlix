import 'package:dartz/dartz.dart';
import 'package:movies_app/features/home/data/models/movie_model/MovieModel.dart';
import '../../../../core/failures/failures.dart';
import '../models/CategoryModel.dart';

abstract class CategoryRepo
{

  Future<Either<Failure,List<CategoryModel>>>fetchCategories();
  Future<Either<Failure,List<MovieModel>>>fetchMoviesByCategory({required num id});

}