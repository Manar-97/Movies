import 'package:movies/data/models/movie_category/genres.dart';

class MovieCategory {
  MovieCategory({this.genres, this.statusCode});

  MovieCategory.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    statusCode = json['status_code'];
  }

  List<Genres>? genres;
  num? statusCode;

  MovieCategory copyWith({
    List<Genres>? genres,
    num? statusCode,
  }) =>
      MovieCategory(
          genres: genres ?? this.genres,
          statusCode: statusCode ?? this.statusCode);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
