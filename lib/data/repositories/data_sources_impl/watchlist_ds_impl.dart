import 'package:injectable/injectable.dart';
import 'package:movies/data/local_storage.dart';
import 'package:movies/data/models/watch_list/watch_list.dart';
import 'package:movies/data/repositories/data_sources/watchlist_ds.dart';

@Injectable(as: WatchListDS)
class WatchListDSImpl extends WatchListDS {
  LocalStorage storage;
  WatchListDSImpl(this.storage);
  @override
  Future<WatchListMovies> getWatchList() async {
    WatchListMovies watchListMovies = await storage.getMovies();
    return watchListMovies;
  }
}
