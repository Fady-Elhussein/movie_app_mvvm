import 'package:dartz/dartz.dart';
import 'package:movie_app_mvvm/core/error/exceptions.dart';
import 'package:movie_app_mvvm/movies/data/data_sources/movies_remote_data_source.dart';
import 'package:movie_app_mvvm/movies/domain/entities/movies_entity.dart';
import 'package:movie_app_mvvm/movies/domain/repositories/base_movies_repository.dart';

import '../../../core/error/failure.dart';

class MoviesRepositoryImpl extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MoviesRepositoryImpl({required this.baseMoviesRemoteDataSource});
  @override
  Future<Either<Failure, List<MoviesEntity>>> getNowPlayingMovies() async {
 try {
      return Right(await baseMoviesRemoteDataSource.getNowPlayingMovies());
    } on ServerExceptions catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.statusMessage,
        ),
      );
    }  }

  @override
  Future<Either<Failure, List<MoviesEntity>>> getPopularMovies() async {
    try {
      return Right(await baseMoviesRemoteDataSource.getPopularMovies());
    } on ServerExceptions catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MoviesEntity>>> getTopRatedMovies() async {
 try {
      return Right(await baseMoviesRemoteDataSource.getTopRatedMovies());
    } on ServerExceptions catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.statusMessage,
        ),
      );
    }  }
}
