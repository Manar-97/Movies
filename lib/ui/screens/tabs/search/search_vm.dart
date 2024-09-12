import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/data/repositories/repo/search_repository.dart';

@injectable
class SearchViewModel extends Cubit<SearchViewModelState> {
  SearchRepository searchRepository;
  SearchViewModel(this.searchRepository) : super(Empty());

  void getResults(String query) async {
    emit(Empty());
    try {
      MovieDetails results = await searchRepository.search(query);
      if (results.results!.isEmpty) {
        emit(Empty());
      } else {
        emit(Success(results.results ?? []));
      }
    } catch (e) {
      emit(Error("something went wrong or no internet"));
    }
  }
}

abstract class SearchViewModelState {}

class Empty extends SearchViewModelState {}

class Success extends SearchViewModelState {
  List<Result> movies;
  Success(this.movies);
}

class Error extends SearchViewModelState {
  String error;
  Error(this.error);
}
