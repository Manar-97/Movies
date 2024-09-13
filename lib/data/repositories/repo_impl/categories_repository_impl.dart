import 'package:injectable/injectable.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/repositories/data_sources/categories_ds.dart';
import 'package:movies/data/repositories/repo/categories_repository.dart';

@Injectable(as: CategorizedMovieRepository)
class CategorizedMovieRepositoryImpl extends CategorizedMovieRepository {
  CategorizedMovieDS source;

  @factoryMethod
  CategorizedMovieRepositoryImpl(this.source);

  @override
  Future<MovieDetails> getCategorizedMovie(num id) async{
    MovieDetails response = await source.getCategorizedMovie(id);
    return response;
  }
}
