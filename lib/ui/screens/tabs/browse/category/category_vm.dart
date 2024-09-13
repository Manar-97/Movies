import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/data/repositories/repo/categories_repository.dart';

@injectable
class CategoryViewModel extends Cubit<CategoryState> {
  CategorizedMovieRepository category;

  CategoryViewModel(this.category) : super(Loading());

  void getFilms(double id) async {
    emit(Loading());
    try {
      MovieDetails result = await category.getCategorizedMovie(id);
      emit(Success(result.results ?? []));
    } catch (e) {
      Error(e.toString());
    }
  }
}

sealed class CategoryState {}

class Loading extends CategoryState {}

class Success extends CategoryState {
  List<Result> types;

  Success(this.types);
}

class Error extends CategoryState {
  String error;

  Error(this.error);
}
