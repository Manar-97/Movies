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
    String json = jsonEncode(appdata.toJson());
    try {
      SharedPreferences init = await SharedPreferences.getInstance();
      await init.setString(filmKey, json);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<WatchListMovies> getMovies() async {
    try {
      SharedPreferences init = await SharedPreferences.getInstance();
      String? data = init.getString(filmKey);
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
