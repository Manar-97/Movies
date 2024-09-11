import 'package:injectable/injectable.dart';
import 'package:movies/data/api_manager.dart';
import 'package:movies/data/local_storage.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/data/repositories/data_sources/similar_ds.dart';

@Injectable(as: SimilarDS)
class SimilarDSImpl extends SimilarDS {
  ApiManager apiManager;
  LocalStorage storage;

  @factoryMethod
  SimilarDSImpl(this.apiManager, this.storage);

  Future<MovieDetails> getSimilar(num id) async {
    MovieDetails similar = await apiManager.getSimilarMovie(id);
    return similar;
  }

  @override
  Future<void> addToLocal(Result movie) async {
    return await storage.addList(movie);
  }
}