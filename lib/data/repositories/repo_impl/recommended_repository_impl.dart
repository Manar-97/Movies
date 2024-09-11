import 'package:injectable/injectable.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/data/repositories/data_sources/recommended_ds.dart';
import 'package:movies/data/repositories/repo/recommended_repository.dart';

@Injectable(as: RecommendedRepositories)
class RecommendedRepositoriesImpl extends RecommendedRepositories {
  RecommendedDS source;
  @factoryMethod
  RecommendedRepositoriesImpl(this.source);

  @override
  Future<MovieDetails> getRecommended() async {
    MovieDetails recommended = await source.getRecommended();
    return recommended;
  }


  @override
  Future<void> addToLocal(Result movie) async{
    return await source.addToLocal(movie);
  }
}
