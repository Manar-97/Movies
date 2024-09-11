import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';

abstract class MovieDetailsRepositories{
  Future<MovieDetails> getMovie(num id);

  Future<void> addToLocal(Result movie);
}