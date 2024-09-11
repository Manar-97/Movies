import 'package:injectable/injectable.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/data/repositories/data_sources/movie_details_ds.dart';
import 'package:movies/data/repositories/repo/movie_details_repository.dart';

@Injectable(as: MovieDetailsRepositories)
class MovieDetailsRepositoriesImpl extends MovieDetailsRepositories {
  MovieDetailsDS source;

  MovieDetailsRepositoriesImpl(this.source);

  @override
  Future<MovieDetails> getMovie(num id) async {
    MovieDetails movie = await source.getMovie(id);
    return movie;
  }

  @override
  Future<void> addToLocal(Result movie) async {
    return await source.addToLocal(movie);
  }
}
