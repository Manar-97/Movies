import 'package:injectable/injectable.dart';
import 'package:movies/data/api_manager.dart';
import 'package:movies/data/local_storage.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/data/repositories/data_sources/new_realse_ds.dart';

@Injectable(as: ReleaseDS)
class ReleaseDSImpl extends ReleaseDS{
  ApiManager apiManager;
  LocalStorage storage;
  ReleaseDSImpl(this.apiManager,this.storage);

  @override
  Future<MovieDetails> getRelease()async{
    MovieDetails release = await apiManager.getNewRelease();
    return release;
  }

  @override
  Future<void> addToLocal(Result movie) async {
    return await storage.addList(movie);
  }
}