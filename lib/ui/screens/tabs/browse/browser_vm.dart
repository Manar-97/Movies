import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/api_manager.dart';
import 'package:movies/data/models/movie_category/genres.dart';
import 'package:movies/data/models/movie_category/movie_category.dart';

class BrowserViewModel extends Cubit<BrowserState> {
  BrowserViewModel() : super(Loading());

  void getCategory() async {
    emit(Loading());
    try {
      MovieCategory response = await ApiManager.getCategory();
      if (response.statusCode != null) {
        emit(Error("Some thing wnent Wrong!"));
      } else {
        emit(Success(response.genres ?? []));
      }
    } catch (e) {
      Error("something went wrong or no internet");
    }
  }
}

sealed class BrowserState {}

class Loading extends BrowserState {}

class Success extends BrowserState {
  List<Genres> types;

  Success(this.types);
}

class Error extends BrowserState {
  String error;

  Error(this.error);
}
