import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/data/repositories/repo/recommended_repository.dart';

@injectable
class RecommendedViewModel extends Cubit<RecommendedState> {
  RecommendedRepositories recommendedRepository;

  RecommendedViewModel(this.recommendedRepository) : super(Loading());

  void getRecommended() async {
    try {
      MovieDetails recommended = await recommendedRepository.getRecommended();
      emit(Success(recommended.results ?? []));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  void addToLocal(Result movie) async {
    await recommendedRepository.addToLocal(movie);
  }
}

abstract class RecommendedState {}

class Success extends RecommendedState {
  List<Result> movie;

  Success(this.movie);
}

class Loading extends RecommendedState {}

class Error extends RecommendedState {
  String error;
  Error(this.error);
}
