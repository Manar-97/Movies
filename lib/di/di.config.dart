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
import '../data/repositories/data_sources/categories_ds.dart' as _i26;
import '../data/repositories/data_sources/movie_details_ds.dart' as _i9;
import '../data/repositories/data_sources/new_realse_ds.dart' as _i20;
import '../data/repositories/data_sources/popular_ds.dart' as _i15;
import '../data/repositories/data_sources/recommended_ds.dart' as _i7;
import '../data/repositories/data_sources/search_ds.dart' as _i31;
import '../data/repositories/data_sources/similar_ds.dart' as _i13;
import '../data/repositories/data_sources/watchlist_ds.dart' as _i5;
import '../data/repositories/data_sources_impl/categories_ds_impl.dart' as _i27;
import '../data/repositories/data_sources_impl/movie_details_ds_impl.dart'
    as _i10;
import '../data/repositories/data_sources_impl/new_realse_ds_impl.dart' as _i21;
import '../data/repositories/data_sources_impl/popular_ds_impl.dart' as _i16;
import '../data/repositories/data_sources_impl/recommended_ds_impl.dart' as _i8;
import '../data/repositories/data_sources_impl/search_ds_impl.dart' as _i32;
import '../data/repositories/data_sources_impl/similar_ds_impl.dart' as _i14;
import '../data/repositories/data_sources_impl/watchlist_ds_impl.dart' as _i6;
import '../data/repositories/repo/categories_repository.dart' as _i34;
import '../data/repositories/repo/movie_details_repository.dart' as _i11;
import '../data/repositories/repo/new_realse_repository.dart' as _i37;
import '../data/repositories/repo/popular_repositories.dart' as _i24;
import '../data/repositories/repo/recommended_repository.dart' as _i28;
import '../data/repositories/repo/search_repository.dart' as _i40;
import '../data/repositories/repo/similar_repository.dart' as _i18;
import '../data/repositories/repo/watchlist_repository.dart' as _i22;
import '../data/repositories/repo_impl/categories_repository_impl.dart' as _i35;
import '../data/repositories/repo_impl/movie_details_repository_impl.dart'
    as _i12;
import '../data/repositories/repo_impl/new_realse_repository_impl.dart' as _i38;
import '../data/repositories/repo_impl/popular_repositories_impl.dart' as _i25;
import '../data/repositories/repo_impl/recommended_repository_impl.dart'
    as _i29;
import '../data/repositories/repo_impl/search_repository_impl.dart' as _i41;
import '../data/repositories/repo_impl/similar_repository_impl.dart' as _i19;
import '../data/repositories/repo_impl/watchlist_repository_impl.dart' as _i23;
import '../ui/screens/movie_details/movie_details_view_model.dart' as _i17;
import '../ui/screens/movie_details/similar_movie/similar_movie_view_model.dart'
    as _i36;
import '../ui/screens/tabs/browse/category/category_vm.dart' as _i42;
import '../ui/screens/tabs/home/new_reales/new_reales_view_model.dart' as _i44;
import '../ui/screens/tabs/home/popular/popular_view_model.dart' as _i39;
import '../ui/screens/tabs/home/recommended/recommended_view_model.dart'
    as _i30;
import '../ui/screens/tabs/search/search_vm.dart' as _i43;
import '../ui/screens/tabs/watchlist/watchlist_vm.dart' as _i33;

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
    gh.factory<_i5.WatchListDS>(
        () => _i6.WatchListDSImpl(gh<_i4.LocalStorage>()));
    gh.factory<_i7.RecommendedDS>(() => _i8.RecommendedDSImpl(
          gh<_i3.ApiManager>(),
          gh<_i4.LocalStorage>(),
        ));
    gh.factory<_i9.MovieDetailsDS>(() => _i10.MovieDetailsDSImpl(
          gh<_i3.ApiManager>(),
          gh<_i4.LocalStorage>(),
        ));
    gh.factory<_i11.MovieDetailsRepositories>(
        () => _i12.MovieDetailsRepositoriesImpl(gh<_i9.MovieDetailsDS>()));
    gh.factory<_i13.SimilarDS>(() => _i14.SimilarDSImpl(
          gh<_i3.ApiManager>(),
          gh<_i4.LocalStorage>(),
        ));
    gh.factory<_i15.PopularDS>(() => _i16.PopularDSImpl(
          gh<_i3.ApiManager>(),
          gh<_i4.LocalStorage>(),
        ));
    gh.factory<_i17.MovieDetailsViewModel>(
        () => _i17.MovieDetailsViewModel(gh<_i11.MovieDetailsRepositories>()));
    gh.factory<_i18.SimilarRepository>(
        () => _i19.SimilarRepositoryImpl(gh<_i13.SimilarDS>()));
    gh.factory<_i20.ReleaseDS>(() => _i21.ReleaseDSImpl(
          gh<_i3.ApiManager>(),
          gh<_i4.LocalStorage>(),
        ));
    gh.factory<_i22.WatchListRepository>(
        () => _i23.WatchListRepositoryImpl(gh<_i5.WatchListDS>()));
    gh.factory<_i24.PopularRepositories>(
        () => _i25.PopularRepositoriesImpl(gh<_i15.PopularDS>()));
    gh.factory<_i26.CategorizedMovieDS>(
        () => _i27.CategorizedMovieDSImpl(gh<_i3.ApiManager>()));
    gh.factory<_i28.RecommendedRepositories>(
        () => _i29.RecommendedRepositoriesImpl(gh<_i7.RecommendedDS>()));
    gh.factory<_i30.RecommendedViewModel>(
        () => _i30.RecommendedViewModel(gh<_i28.RecommendedRepositories>()));
    gh.factory<_i31.SearchDS>(() => _i32.SearchDSImpl(gh<_i3.ApiManager>()));
    gh.factory<_i33.WatchListViewModel>(
        () => _i33.WatchListViewModel(gh<_i22.WatchListRepository>()));
    gh.factory<_i34.CategorizedMovieRepository>(() =>
        _i35.CategorizedMovieRepositoryImpl(gh<_i26.CategorizedMovieDS>()));
    gh.factory<_i36.SimilarMoviesViewModel>(
        () => _i36.SimilarMoviesViewModel(gh<_i18.SimilarRepository>()));
    gh.factory<_i37.ReleaseRepositories>(
        () => _i38.ReleaseRepositoriesImpl(gh<_i20.ReleaseDS>()));
    gh.factory<_i39.PopularViewModel>(
        () => _i39.PopularViewModel(gh<_i24.PopularRepositories>()));
    gh.factory<_i40.SearchRepository>(
        () => _i41.SearchRepositoryImpl(gh<_i31.SearchDS>()));
    gh.factory<_i42.CategoryViewModel>(
        () => _i42.CategoryViewModel(gh<_i34.CategorizedMovieRepository>()));
    gh.factory<_i43.SearchViewModel>(
        () => _i43.SearchViewModel(gh<_i40.SearchRepository>()));
    gh.factory<_i44.NewReleaseViewModel>(
        () => _i44.NewReleaseViewModel(gh<_i37.ReleaseRepositories>()));
    return this;
  }
}
