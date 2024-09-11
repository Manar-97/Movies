import 'package:movies/data/models/movie_datails/result_model.dart';

class WatchListMovies {
  List<Result>? movies = [];

  WatchListMovies();

  WatchListMovies.fromjson(dynamic json) {
    if (json['movies'] != null) {
      movies = [];
      json['movies'].forEach((v) {
        movies?.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['movies'] = movies;
    return map;
  }
}