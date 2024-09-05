import 'package:movies/data/api_manager.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/repositories/data_sources/popular_ds.dart';

class PopularDSImpl extends PopularDS{
  ApiManager apiManager;
  PopularDSImpl(this.apiManager);

  @override
  Future<MovieDetails> getPopular()async {
    MovieDetails popular = await apiManager.getPopular();
    return popular;
  }
}