import 'package:hive/hive.dart';

/// adult : false
/// backdrop_path : "/8g9ZdvHX6jszRY71aVtpRUmHQzJ.jpg"
/// genre_ids : [18,53]
/// id : 958182
/// original_language : "es"
/// original_title : "Heroico"
/// overview : "Luis, an 18-year-old boy with Indigenous roots, enters the Heroic Military College in hopes of ensuring a better future. There, he encounters a rigid and institutionally violent system designed to turn him into a perfect soldier."
/// popularity : 69.409
/// poster_path : "/w0iYqKZYoVmyoX0Av4FdsDiDXWo.jpg"
/// release_date : "2023-09-21"
/// title : "Heroic"
/// video : false
/// vote_average : 6.3
/// vote_count : 10

part "MovieModel.g.dart";

@HiveType(typeId: 0)
class MovieModel extends HiveObject {
  MovieModel({
      this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,});

  MovieModel.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  @HiveField(0)
  bool? adult;
  @HiveField(1)
  String? backdropPath;
  @HiveField(2)
  List<num>? genreIds;
  @HiveField(3)
  num? id;
  @HiveField(4)
  String? originalLanguage;
  @HiveField(5)
  String? originalTitle;
  @HiveField(6)
  String? overview;
  @HiveField(7)
  num? popularity;
  @HiveField(8)
  String? posterPath;
  @HiveField(9)
  String? releaseDate;
  @HiveField(10)
  String? title;
  @HiveField(11)
  bool? video;
  @HiveField(12)
  num? voteAverage;
  @HiveField(13)
  num? voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}