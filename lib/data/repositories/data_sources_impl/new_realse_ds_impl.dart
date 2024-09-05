import 'package:movies/data/api_manager.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/repositories/data_sources/new_realse_ds.dart';

class ReleaseDSImpl extends ReleaseDS{
  ApiManager apiManager;
  ReleaseDSImpl(this.apiManager);

  @override
  Future<MovieDetails> getRelease()async{
    MovieDetails release = await apiManager.getUpComing();
    return release;
  }
}