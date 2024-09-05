import 'package:movies/data/api_manager.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/repositories/data_sources/recommended_ds.dart';

class RecommendedDSImpl extends RecommendedDS {
  ApiManager apiManager;
  RecommendedDSImpl(this.apiManager);

  @override
  Future<MovieDetails> getRecommended() async {
    MovieDetails recommended = await apiManager.getRecommended();
    return recommended;
  }
}
