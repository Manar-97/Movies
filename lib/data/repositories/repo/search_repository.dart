import 'package:movies/data/models/movie_datails/movie_details.dart';

abstract class SearchRepository{
  Future<MovieDetails> search(String query);
}