import 'package:injectable/injectable.dart';
import 'package:movies/data/api_manager.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/repositories/data_sources/search_ds.dart';

@Injectable(as: SearchDS)
class SearchDSImpl extends SearchDS {
  ApiManager apiManager;
  SearchDSImpl(this.apiManager);

  @override
  Future<MovieDetails> search(String query) async {
    MovieDetails results = await apiManager.getSearchResults(query);
    return results;
  }
}
