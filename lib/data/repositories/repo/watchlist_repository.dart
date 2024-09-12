import 'package:movies/data/models/watch_list/watch_list.dart';

abstract class WatchListRepository{
  Future<WatchListMovies> getWatchList();
}