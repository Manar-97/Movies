import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/data/repositories/repo/new_realse_repository.dart';

@injectable
class NewReleaseViewModel extends Cubit<NewReleaseState> {
  ReleaseRepositories releaseRepository;

  NewReleaseViewModel(this.releaseRepository) : super(Loading());

  void getNewRelease() async {
    try {
      MovieDetails newRelease = await releaseRepository.getRelease();
      emit(Success(newRelease.results ?? []));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  void addToLocal(Result movie) async {
    await releaseRepository.addToLocal(movie);
  }
}

abstract class NewReleaseState {}

class Success extends NewReleaseState {
  List<Result> movie;

  Success(this.movie);
}

class Loading extends NewReleaseState {}

class Error extends NewReleaseState {
  String error;
  Error(this.error);
}
