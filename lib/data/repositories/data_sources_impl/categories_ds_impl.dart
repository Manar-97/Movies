import 'package:injectable/injectable.dart';
import 'package:movies/data/api_manager.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/repositories/data_sources/categories_ds.dart';

@Injectable(as: CategorizedMovieDS)
class CategorizedMovieDSImpl extends CategorizedMovieDS {
  ApiManager apiManager;

  @factoryMethod
  CategorizedMovieDSImpl(this.apiManager);

  @override
  Future<MovieDetails> getCategorizedMovie(num id) async {
    MovieDetails response = await apiManager.getGenereMovie(id);
    return response;
  }
}