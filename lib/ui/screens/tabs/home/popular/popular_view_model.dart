import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/api_manager.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/repositories/repo/popular_repositories.dart';
import 'package:movies/ui/base/base.dart';

class PopularViewModel extends Cubit<PopularViewModelState>{
  PopularRepositories popularRepositories;

  BaseApiState popularApiState = BaseLoadingState();
  PopularViewModel(this.popularRepositories) :super(PopularViewModelState.initial());

  void getPopular()async{
    try {
      emit(PopularViewModelState(BaseLoadingState()));
      MovieDetails popular = await popularRepositories.getPopular();
      emit(PopularViewModelState(BaseSuccessState(popular.results)));
    } catch (e) {
      emit(PopularViewModelState(BaseErrorState(e.toString())));
    }
  }
}

class PopularViewModelState {
  late BaseApiState popularApiState;

  PopularViewModelState(this.popularApiState);
  PopularViewModelState.initial(){
    popularApiState = BaseLoadingState();
  }
}