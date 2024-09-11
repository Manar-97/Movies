import 'package:injectable/injectable.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/data/repositories/data_sources/new_realse_ds.dart';
import 'package:movies/data/repositories/repo/new_realse_repository.dart';

@Injectable(as: ReleaseRepositories)
class ReleaseRepositoriesImpl extends ReleaseRepositories{
  ReleaseDS source;
  @factoryMethod
  ReleaseRepositoriesImpl(this.source);

  @override
  Future<MovieDetails> getRelease()async{
    MovieDetails release = await source.getRelease();
    return release;
  }

  @override
  Future<void> addToLocal(Result movie) async{
    return await source.addToLocal(movie);
  }
}