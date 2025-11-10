import 'package:equatable/equatable.dart';
import 'package:movie_app_mvvm/core/utiles/enumes.dart';
import 'package:movie_app_mvvm/movies/domain/entities/movies_entity.dart';

class MoviesState extends Equatable {
  final List<MoviesEntity> nowPlayingMovies;
  final List<MoviesEntity> popularMovies;
  final List<MoviesEntity> topRatedMovies;
  final RequestStates nowPlayingMoviesState;
  final String nowPlayingMoviesMessage;
  final RequestStates popularMoviesState;
  final String popularMoviesMessage;
  final RequestStates topRatedMoviesState;
  final String topRatedMoviesMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.topRatedMoviesMessage = "",
    this.nowPlayingMoviesMessage = "",
    this.popularMoviesMessage = "",
    this.popularMoviesState = RequestStates.loading,
    this.topRatedMoviesState = RequestStates.loading,
    this.nowPlayingMoviesState = RequestStates.loading,
  });

  @override
  List<Object> get props => [
    nowPlayingMoviesMessage,
    nowPlayingMoviesState,
    nowPlayingMovies,
    popularMoviesMessage,
    popularMoviesState,
    popularMovies,
    topRatedMoviesMessage,
    topRatedMoviesState,
    topRatedMovies,
  ];
}

// final class MoviesInitial extends MoviesState {}
// final class MoviesLoading extends MoviesState {}
// final class MoviesInitial extends MoviesState {}
