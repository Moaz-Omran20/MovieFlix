import 'package:dartz/dartz.dart';
import 'package:movies_app/features/movie_details/data/models/movie_detail_model/MovieDetailModel.dart';
import 'package:movies_app/features/movie_details/data/models/top_cast_model/TopCastModel.dart';
import '../../../../core/failures/failures.dart';
abstract class MovieDetailRepo
{

Future<MovieDetailModel>fetchMovieDetails({required num id});
Future<Either<Failure,List<TopCastModel>>>fetchMovieTopCasts({required num id});



}