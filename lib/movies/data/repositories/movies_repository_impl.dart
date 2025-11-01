import 'package:movie_app_mvvm/movies/data/data_sources/movies_remote_data_source.dart';
import 'package:movie_app_mvvm/movies/domain/entities/movies_entity.dart';
import 'package:movie_app_mvvm/movies/domain/repositories/base_movies_repository.dart';

class MoviesRepositoryImpl extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MoviesRepositoryImpl({required this.baseMoviesRemoteDataSource});
  @override
  Future<List<MoviesEntity>> getNowPlayingMovies() async {
    return await baseMoviesRemoteDataSource.getNowPlayingMovies();
  }

  @override
  Future<List<MoviesEntity>> getPopularMovies() async {
    return await baseMoviesRemoteDataSource.getPopularMovies();
  }

  @override
  Future<List<MoviesEntity>> getTopRatedMovies() async {
    return await baseMoviesRemoteDataSource.getTopRatedMovies();
  }
}
