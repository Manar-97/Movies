import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/repositories/data_sources/movie_details_ds.dart';
import 'package:movies/data/repositories/repo/movie_details_repository.dart';

class MovieDetailsRepositoriesImpl extends MovieDetailsRepositories{
  MovieDetailsDS source;
  MovieDetailsRepositoriesImpl(this.source);

  Future<MovieDetails> getMovie(num movieId)async{
    MovieDetails movie = await source.getMovie(movieId);
    return movie;
  }
}