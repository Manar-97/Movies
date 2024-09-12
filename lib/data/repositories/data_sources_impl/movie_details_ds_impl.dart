import 'package:injectable/injectable.dart';
import 'package:movies/data/api_manager.dart';
import 'package:movies/data/local_storage.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/data/repositories/data_sources/movie_details_ds.dart';

@Injectable(as: MovieDetailsDS)
class MovieDetailsDSImpl extends MovieDetailsDS{
  ApiManager apiManager;
  LocalStorage storage;
  MovieDetailsDSImpl(this.apiManager,this.storage);

  @override
  Future<MovieDetails> getMovie(num id)async{
    MovieDetails movie = await apiManager.getMovieDetails(id);
    return movie;
  }

  @override
  Future<void> addToLocal(Result movie) async {
    return await storage.addList(movie);
  }

  @override
   void deleteFromLocal()  {
    return  storage.delete();
  }
}