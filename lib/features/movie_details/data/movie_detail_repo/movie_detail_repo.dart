import 'package:dartz/dartz.dart';
import 'package:movies_app/features/movie_details/data/models/movie_detail_model/MovieDetailModel.dart';

import '../../../../core/failures/failures.dart';

abstract class MovieDetailRepo
{

Future<MovieDetailModel>fetchMovieDetails({required num id});



}