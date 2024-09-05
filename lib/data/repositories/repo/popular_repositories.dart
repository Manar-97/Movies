import 'package:movies/data/models/movie_datails/movie_details.dart';

abstract class PopularRepositories{
  Future<MovieDetails> getPopular();
}