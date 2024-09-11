import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/data/repositories/repo/similar_repository.dart';

@injectable
class SimilarMoviesViewModel extends Cubit<SimilarMoviesState> {
  SimilarRepository similarRepository;

  @factoryMethod
  SimilarMoviesViewModel(this.similarRepository) : super(Loading());

  void getSimilar(num id) async {
    emit(Loading());
    try {
      MovieDetails similar = await similarRepository.getSimilar(id);
      emit(Success(similar.results ?? []));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  void addToLocal(Result movie) async {
    await similarRepository.addToLocal(movie);
  }
}

sealed class SimilarMoviesState {}

class Success extends SimilarMoviesState {
  List<Result> movies;

  Success(this.movies);
}

class Error extends SimilarMoviesState {
  String error;

  Error(this.error);
}

class Loading extends SimilarMoviesState {}