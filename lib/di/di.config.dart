// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api_manager.dart' as _i3;
import '../data/local_storage.dart' as _i4;
import '../data/repositories/data_sources/movie_details_ds.dart' as _i7;
import '../data/repositories/data_sources/new_realse_ds.dart' as _i18;
import '../data/repositories/data_sources/popular_ds.dart' as _i13;
import '../data/repositories/data_sources/recommended_ds.dart' as _i5;
import '../data/repositories/data_sources/similar_ds.dart' as _i11;
import '../data/repositories/data_sources_impl/movie_details_ds_impl.dart'
    as _i8;
import '../data/repositories/data_sources_impl/new_realse_ds_impl.dart' as _i19;
import '../data/repositories/data_sources_impl/popular_ds_impl.dart' as _i14;
import '../data/repositories/data_sources_impl/recommended_ds_impl.dart' as _i6;
import '../data/repositories/data_sources_impl/similar_ds_impl.dart' as _i12;
import '../data/repositories/repo/movie_details_repository.dart' as _i9;
import '../data/repositories/repo/new_realse_repository.dart' as _i26;
import '../data/repositories/repo/popular_repositories.dart' as _i20;
import '../data/repositories/repo/recommended_repository.dart' as _i22;
import '../data/repositories/repo/similar_repository.dart' as _i16;
import '../data/repositories/repo_impl/movie_details_repository_impl.dart'
    as _i10;
import '../data/repositories/repo_impl/new_realse_repository_impl.dart' as _i27;
import '../data/repositories/repo_impl/popular_repositories_impl.dart' as _i21;
import '../data/repositories/repo_impl/recommended_repository_impl.dart'
    as _i23;
import '../data/repositories/repo_impl/similar_repository_impl.dart' as _i17;
import '../ui/screens/movie_details/movie_details_view_model.dart' as _i15;
import '../ui/screens/movie_details/similar_movie/similar_movie_view_model.dart'
    as _i25;
import '../ui/screens/tabs/home/new_reales/new_reales_view_model.dart' as _i29;
import '../ui/screens/tabs/home/popular/popular_view_model.dart' as _i28;
import '../ui/screens/tabs/home/recommended/recommended_view_model.dart'
    as _i24;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.singleton<_i4.LocalStorage>(() => _i4.LocalStorage());
    gh.factory<_i5.RecommendedDS>(() => _i6.RecommendedDSImpl(
          gh<_i3.ApiManager>(),
          gh<_i4.LocalStorage>(),
        ));
    gh.factory<_i7.MovieDetailsDS>(() => _i8.MovieDetailsDSImpl(
          gh<_i3.ApiManager>(),
          gh<_i4.LocalStorage>(),
        ));
    gh.factory<_i9.MovieDetailsRepositories>(
        () => _i10.MovieDetailsRepositoriesImpl(gh<_i7.MovieDetailsDS>()));
    gh.factory<_i11.SimilarDS>(() => _i12.SimilarDSImpl(
          gh<_i3.ApiManager>(),
          gh<_i4.LocalStorage>(),
        ));
    gh.factory<_i13.PopularDS>(() => _i14.PopularDSImpl(
          gh<_i3.ApiManager>(),
          gh<_i4.LocalStorage>(),
        ));
    gh.factory<_i15.MovieDetailsViewModel>(
        () => _i15.MovieDetailsViewModel(gh<_i9.MovieDetailsRepositories>()));
    gh.factory<_i16.SimilarRepository>(
        () => _i17.SimilarRepositoryImpl(gh<_i11.SimilarDS>()));
    gh.factory<_i18.ReleaseDS>(() => _i19.ReleaseDSImpl(
          gh<_i3.ApiManager>(),
          gh<_i4.LocalStorage>(),
        ));
    gh.factory<_i20.PopularRepositories>(
        () => _i21.PopularRepositoriesImpl(gh<_i13.PopularDS>()));
    gh.factory<_i22.RecommendedRepositories>(
        () => _i23.RecommendedRepositoriesImpl(gh<_i5.RecommendedDS>()));
    gh.factory<_i24.RecommendedViewModel>(
        () => _i24.RecommendedViewModel(gh<_i22.RecommendedRepositories>()));
    gh.factory<_i25.SimilarMoviesViewModel>(
        () => _i25.SimilarMoviesViewModel(gh<_i16.SimilarRepository>()));
    gh.factory<_i26.ReleaseRepositories>(
        () => _i27.ReleaseRepositoriesImpl(gh<_i18.ReleaseDS>()));
    gh.factory<_i28.PopularViewModel>(
        () => _i28.PopularViewModel(gh<_i20.PopularRepositories>()));
    gh.factory<_i29.NewReleaseViewModel>(
        () => _i29.NewReleaseViewModel(gh<_i26.ReleaseRepositories>()));
    return this;
  }
}
