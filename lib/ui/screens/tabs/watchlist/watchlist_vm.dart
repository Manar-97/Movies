import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/data/models/watch_list/watch_list.dart';
import 'package:movies/data/repositories/repo/watchlist_repository.dart';

@injectable
class WatchListViewModel extends Cubit<WatchListState> {
  WatchListRepository watchListRepository;
  WatchListViewModel(this.watchListRepository) : super(Loading());

  Future<void> getWatchList() async {
    emit(Loading());
    try {
      WatchListMovies movies = await watchListRepository.getWatchList();
      return emit(Success(movies.movies ?? []));
    } catch (e) {
      return emit(Error(e.toString()));
    }
  }
}

abstract class WatchListState {}

class Success extends WatchListState {
  List<Result> movies;
  Success(this.movies);
}

class Error extends WatchListState {
  String error;
  Error(this.error);
}

class Loading extends WatchListState {}
