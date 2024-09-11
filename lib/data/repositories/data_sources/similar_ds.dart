import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';

abstract class SimilarDS{
  Future<MovieDetails> getSimilar(num id);

  Future<void> addToLocal(Result movie);
}