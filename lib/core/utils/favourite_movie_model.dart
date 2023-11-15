import 'package:hive/hive.dart';
import 'package:movies_app/features/home/data/models/movie_model/MovieModel.dart';

part 'favourite_movie_model.g.dart';

@HiveType(typeId: 1)
class FavouriteMovieModel extends HiveObject {
  @HiveField(0)
  num id;
  @HiveField(1)
  String backdropPath;
  @HiveField(2)
  String title;
  @HiveField(3)
  String date;
  @HiveField(4)
  num rating;

  FavouriteMovieModel(
      {required this.id,
      required this.backdropPath,
      required this.title,
      required this.date,
      required this.rating});

  factory FavouriteMovieModel.fromModel(MovieModel movieModel) {
    return FavouriteMovieModel(
        id: movieModel.id!,
        backdropPath: movieModel.backdropPath ?? "",
        title: movieModel.title ?? "",
        date: movieModel.releaseDate ?? "",
        rating: movieModel.voteAverage ?? 0);
  }
}
