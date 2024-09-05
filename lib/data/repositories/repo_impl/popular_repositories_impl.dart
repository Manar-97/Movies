import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/repositories/data_sources/popular_ds.dart';
import 'package:movies/data/repositories/repo/popular_repositories.dart';

class PopularRepositoriesImpl extends PopularRepositories {
  PopularDS source;
  PopularRepositoriesImpl(this.source);

  @override
  Future<MovieDetails> getPopular() async {
    MovieDetails popular = await source.getPopular();
    return popular;
  }
}
