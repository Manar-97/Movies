import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/data/repositories/repo/popular_repositories.dart';

@injectable
class PopularViewModel extends Cubit<PopularState> {
  PopularRepositories popularRepositories;

  @factoryMethod
  PopularViewModel(this.popularRepositories) : super(Loading());

  void getPopularMovies() async {
    try {
      MovieDetails popular = await popularRepositories.getPopular();
      emit(Success(popular.results ?? []));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}

abstract class PopularState {}

class Success extends PopularState {
  List<Result> movie;

  Success(this.movie);
}

class Loading extends PopularState {}

class Error extends PopularState {
  String error;
  Error(this.error);
}
