import 'package:movies/data/models/movie_datails/movie_details.dart';

abstract class CategorizedMovieRepository {
  Future<MovieDetails> getCategorizedMovie(num id);
}