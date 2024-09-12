import 'package:movies/data/models/watch_list/watch_list.dart';

abstract class WatchListDS{
  Future<WatchListMovies> getWatchList();
}