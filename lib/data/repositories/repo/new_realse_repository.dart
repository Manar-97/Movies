import 'package:movies/data/models/movie_datails/movie_details.dart';

abstract class ReleaseRepositories{
  Future<MovieDetails> getRelease();
}