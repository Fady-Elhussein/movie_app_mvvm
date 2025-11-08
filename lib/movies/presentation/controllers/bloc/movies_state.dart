import 'package:equatable/equatable.dart';
import 'package:movie_app_mvvm/core/utiles/enumes.dart';
import 'package:movie_app_mvvm/movies/domain/entities/movies_entity.dart';

class MoviesState extends Equatable {
  final List<MoviesEntity> nowPlayingMovies;
  final RequestStates nowPlayingMoviesState;
  final String message;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMoviesState = RequestStates.loading,
    this.message = "",
  });

  @override
  List<Object> get props => [message, nowPlayingMoviesState, nowPlayingMovies];
}

// final class MoviesInitial extends MoviesState {}
// final class MoviesLoading extends MoviesState {}
// final class MoviesInitial extends MoviesState {}
