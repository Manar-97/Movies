import 'package:injectable/injectable.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/repositories/data_sources/search_ds.dart';
import 'package:movies/data/repositories/repo/search_repository.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImpl extends SearchRepository {
  SearchDS source;
  SearchRepositoryImpl(this.source);

  @override
  Future<MovieDetails> search(String query) async {
    MovieDetails results = await source.search(query);
    return results;
  }
}
