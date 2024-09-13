import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/data/models/watch_list/watch_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class LocalStorage {
  static const String filmKey = "movies";
  static WatchListMovies appdata = WatchListMovies();

  Future<void> addList(Result movie) async {
    if (!appdata.movies!.contains(movie)) {
      appdata.movies?.add(movie);
    }
    String movies = jsonEncode(appdata.toJson());
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString(filmKey, movies);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<WatchListMovies> getMovies() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? data = pref.getString(filmKey);
      var json = jsonDecode(data ?? "");
      appdata = WatchListMovies.fromjson(json);
      return appdata;
    } catch (e) {
      print(e.toString());
    }
    return WatchListMovies();
  }

  void delete() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
// import 'package:hive_flutter/adapters.dart';
// import 'package:injectable/injectable.dart';
// import 'package:movies/data/models/movie_datails/movie_details.dart';
// import 'package:movies/data/models/movie_datails/result_model.dart';
// import 'package:movies/data/models/watch_list/watch_list.dart';
// import 'package:movies/ui/screens/tabs/watchlist/watchlist.dart';
//
// @injectable
// class HiveManager {
//   static void init() async {
//     await Hive.initFlutter();
//     Hive.registerAdapter(MovieAdapter());
//   }
//
//   Future saveMovies(MovieDetails movieDetails, String movieId) async {
//     Box box = await Hive.openBox('movies');
//     box.put(movieId, movieDetails);
//   }
//
//   Future<MovieDetails> getMovies(String movieId) async {
//     Box box = await Hive.openBox('movies');
//     return box.get(movieId);
//   }
// }
//
// void addList(Result movie) async {
//   WatchListMovies watchList = WatchListMovies();
//
//   if (!watchList.movies!.contains(movie)) {
//     watchList.movies!.add(movie);
//     final filmBox = Hive.box('movies');
//     filmBox.add(movie);
//   }
// }
//
// class MovieAdapter extends TypeAdapter<MovieDetails> {
//   @override
//   final typeId = 0;
//
//   @override
//   MovieDetails read(BinaryReader reader) {
//     return MovieDetails.fromJson(reader.read());
//   }
//
//   @override
//   void write(BinaryWriter writer, MovieDetails movieDetails) {
//     writer.write(movieDetails.toJson());
//   }
// }
