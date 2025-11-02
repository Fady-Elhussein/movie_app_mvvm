import 'package:dartz/dartz.dart';
import 'package:movie_app_mvvm/movies/domain/entities/movies_entity.dart';

import '../../../core/error/failure.dart';

/// BaseMoviesRepository is an abstract class defining the contract for operations
/// related to data within the domain layer.
/// Concrete implementations of this repository interface will be provided
/// in the data layer to interact with specific data sources (e.g., API, database).
abstract class BaseMoviesRepository {
    Future<Either<Failure, List<MoviesEntity>>> getNowPlayingMovies();
    Future<Either<Failure, List<MoviesEntity>>> getPopularMovies();
    Future<Either<Failure, List<MoviesEntity>>> getTopRatedMovies();
}
