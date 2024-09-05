import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';

abstract class MovieDetailsDS{
  Future<MovieDetails> getMovie(num movieId);

  // Future<void> saveMovie(Results movie);
}