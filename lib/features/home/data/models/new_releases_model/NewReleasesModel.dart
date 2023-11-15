// /// adult : false
// /// backdrop_path : "/8g9ZdvHX6jszRY71aVtpRUmHQzJ.jpg"
// /// genre_ids : [18,53]
// /// id : 958182
// /// original_language : "es"
// /// original_title : "Heroico"
// /// overview : "Luis, an 18-year-old boy with Indigenous roots, enters the Heroic Military College in hopes of ensuring a better future. There, he encounters a rigid and institutionally violent system designed to turn him into a perfect soldier."
// /// popularity : 69.409
// /// poster_path : "/w0iYqKZYoVmyoX0Av4FdsDiDXWo.jpg"
// /// release_date : "2023-09-21"
// /// title : "Heroic"
// /// video : false
// /// vote_average : 6.3
// /// vote_count : 10
//
// class NewReleasesModel {
//   NewReleasesModel({
//       this.adult,
//       this.backdropPath,
//       this.genreIds,
//       this.id,
//       this.originalLanguage,
//       this.originalTitle,
//       this.overview,
//       this.popularity,
//       this.posterPath,
//       this.releaseDate,
//       this.title,
//       this.video,
//       this.voteAverage,
//       this.voteCount,});
//
//   NewReleasesModel.fromJson(dynamic json) {
//     adult = json['adult'];
//     backdropPath = json['backdrop_path'];
//     genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
//     id = json['id'];
//     originalLanguage = json['original_language'];
//     originalTitle = json['original_title'];
//     overview = json['overview'];
//     popularity = json['popularity'];
//     posterPath = json['poster_path'];
//     releaseDate = json['release_date'];
//     title = json['title'];
//     video = json['video'];
//     voteAverage = json['vote_average'];
//     voteCount = json['vote_count'];
//   }
//   bool? adult;
//   String? backdropPath;
//   List<num>? genreIds;
//   num? id;
//   String? originalLanguage;
//   String? originalTitle;
//   String? overview;
//   num? popularity;
//   String? posterPath;
//   String? releaseDate;
//   String? title;
//   bool? video;
//   num? voteAverage;
//   num? voteCount;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['adult'] = adult;
//     map['backdrop_path'] = backdropPath;
//     map['genre_ids'] = genreIds;
//     map['id'] = id;
//     map['original_language'] = originalLanguage;
//     map['original_title'] = originalTitle;
//     map['overview'] = overview;
//     map['popularity'] = popularity;
//     map['poster_path'] = posterPath;
//     map['release_date'] = releaseDate;
//     map['title'] = title;
//     map['video'] = video;
//     map['vote_average'] = voteAverage;
//     map['vote_count'] = voteCount;
//     return map;
//   }
//
// }