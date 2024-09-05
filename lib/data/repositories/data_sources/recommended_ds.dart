import 'package:movies/data/models/movie_datails/movie_details.dart';

abstract class RecommendedDS{
  Future<MovieDetails> getRecommended();
}