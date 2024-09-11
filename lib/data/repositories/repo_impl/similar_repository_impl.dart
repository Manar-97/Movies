import 'package:injectable/injectable.dart';
import 'package:movies/data/api_manager.dart';
import 'package:movies/data/local_storage.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/data/repositories/data_sources/similar_ds.dart';
import 'package:movies/data/repositories/repo/similar_repository.dart';

@Injectable(as: SimilarRepository)
class SimilarRepositoryImpl extends SimilarRepository {
  SimilarDS source;
  SimilarRepositoryImpl(this.source);


  Future<MovieDetails> getSimilar(num id) async {
    MovieDetails similar = await source.getSimilar(id);
    return similar;
  }

  @override
  Future<void> addToLocal(Result movie) async {
    return await source.addToLocal(movie);
  }
}