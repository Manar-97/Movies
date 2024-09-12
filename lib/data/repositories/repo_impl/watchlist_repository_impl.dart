import 'package:injectable/injectable.dart';
import 'package:movies/data/models/watch_list/watch_list.dart';
import 'package:movies/data/repositories/data_sources/watchlist_ds.dart';
import 'package:movies/data/repositories/repo/watchlist_repository.dart';

@Injectable(as: WatchListRepository)
class WatchListRepositoryImpl extends WatchListRepository {
  WatchListDS source;
  WatchListRepositoryImpl(this.source);
  @override
  Future<WatchListMovies> getWatchList() async {
    WatchListMovies watchListMovies = await source.getWatchList();
    return watchListMovies;
  }
}
