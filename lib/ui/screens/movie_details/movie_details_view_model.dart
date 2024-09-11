import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/data/repositories/repo/movie_details_repository.dart';

@injectable
class MovieDetailsViewModel extends Cubit<MovieDetailsState> {
  MovieDetailsRepositories movieDetailsRepositories;

  MovieDetailsViewModel(this.movieDetailsRepositories) : super(Loading());

  void getMovieDetails(num id) async {
    try {
      MovieDetails movieDetails = await movieDetailsRepositories.getMovie(id);
      emit(Success(movieDetails));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  void addToLocal(Result movie) async {
    await movieDetailsRepositories.addToLocal(movie);
  }

  // void hasIntrnet({num id = 0}) async {
  //   bool result = await InternetConnectionChecker().hasConnection;
  //   if (result) {
  //     getFilm(id);
  //   } else {
  //     emit(NoIntrnet());
  //   }
  // }
}

abstract class MovieDetailsState {}

class Success extends MovieDetailsState {
  MovieDetails movie;

  Success(this.movie);
}

class Loading extends MovieDetailsState {}

class Error extends MovieDetailsState {
  String error;
  Error(this.error);
}
