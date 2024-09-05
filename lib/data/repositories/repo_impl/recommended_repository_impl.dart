import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/repositories/data_sources/recommended_ds.dart';
import 'package:movies/data/repositories/repo/recommended_repository.dart';

class RecommendedRepositoriesImpl extends RecommendedRepositories {
  RecommendedDS source;
  RecommendedRepositoriesImpl(this.source);

  @override
  Future<MovieDetails> getRecommended() async {
    MovieDetails recommended = await source.getRecommended();
    return recommended;
  }
}
