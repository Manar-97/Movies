import 'package:movies/data/api_manager.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/repositories/data_sources/movie_details_ds.dart';

class MovieDetailsDSImpl extends MovieDetailsDS{
  ApiManager apiManager;
  MovieDetailsDSImpl(this.apiManager);

  @override
  Future<MovieDetails> getMovie(num movieId)async{
    MovieDetails movie = await apiManager.getMovieDetails(movieId);
    return movie;
  }
}