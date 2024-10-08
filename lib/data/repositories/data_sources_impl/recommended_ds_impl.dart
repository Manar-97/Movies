import 'package:injectable/injectable.dart';
import 'package:movies/data/api_manager.dart';
import 'package:movies/data/local_storage.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/data/repositories/data_sources/recommended_ds.dart';

@Injectable(as: RecommendedDS)
class RecommendedDSImpl extends RecommendedDS {
  ApiManager apiManager;
  LocalStorage storage;
  RecommendedDSImpl(this.apiManager,this.storage);

  @override
  Future<MovieDetails> getRecommended() async {
    MovieDetails recommended = await apiManager.getRecommended();
    return recommended;
  }

  @override
  Future<void> addToLocal(Result movie) async {
    return await storage.addList(movie);
  }
}
