import 'package:injectable/injectable.dart';
import 'package:movies/data/api_manager.dart';
import 'package:movies/data/local_storage.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/data/repositories/data_sources/popular_ds.dart';

@Injectable(as: PopularDS)
class PopularDSImpl extends PopularDS{
  ApiManager apiManager;
  LocalStorage storage;
  PopularDSImpl(this.apiManager,this.storage);

  @override
  Future<MovieDetails> getPopular()async {
    MovieDetails popular = await apiManager.getPopular();
    return popular;
  }

  Future<void> addToLocal (Result movie) async {
    return await storage.addList(movie);
  }
}