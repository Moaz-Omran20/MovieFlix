import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/features/home/data/models/movie_model/MovieModel.dart';

abstract class SearchRepo
{

  Future<Either<Failure,List<MovieModel>>> fetchSearchedMovies({required String name});


}