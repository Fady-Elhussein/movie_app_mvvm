import 'package:get_it/get_it.dart';
import 'package:movie_app_mvvm/movies/data/data_sources/movies_remote_data_source.dart';
import 'package:movie_app_mvvm/movies/data/repositories/movies_repository_impl.dart';
import 'package:movie_app_mvvm/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_app_mvvm/movies/presentation/controllers/bloc/movies_bloc.dart';

import '../../movies/domain/repositories/base_movies_repository.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //Bloc
    sl.registerFactory(() => MoviesBloc(getNowPlayingMoviesUseCase: sl()));
    //DataSource
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
      () => MoviesRemoteDataSource(),
    );

    //UseCase
    sl.registerLazySingleton(
      () => GetNowPlayingMoviesUseCase(baseMoviesRepository: sl()),
    );
    //Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
      () => MoviesRepositoryImpl(baseMoviesRemoteDataSource: sl()),
    );
  }
}
