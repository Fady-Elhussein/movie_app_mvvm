import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app_mvvm/core/utiles/enumes.dart';
import 'package:movie_app_mvvm/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app_mvvm/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_app_mvvm/movies/presentation/controllers/bloc/movies_event.dart';
import 'package:movie_app_mvvm/movies/presentation/controllers/bloc/movies_state.dart';
import '../../../../core/error/failure.dart';
import '../../../domain/entities/movies_entity.dart';
import '../../../domain/usecases/get_now_playing_movies_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc({
    required this.getNowPlayingMoviesUseCase,
    required this.getPopularMoviesUseCase,
    required this.getTopRatedMoviesUseCase,
  }) : super(MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final Either<Failure, List<MoviesEntity>> response =
          await getNowPlayingMoviesUseCase.execute();
      response.fold(
        (ifLeft) => emit(
          MoviesState(
            nowPlayingMoviesState: RequestStates.error,
            nowPlayingMoviesMessage: ifLeft.message,
          ),
        ),
        (nowPlayingMoviesList) => emit(
          MoviesState(
            nowPlayingMoviesState: RequestStates.loaded,
            nowPlayingMovies: nowPlayingMoviesList,
          ),
        ),
      );
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final Either<Failure, List<MoviesEntity>> response =
          await getPopularMoviesUseCase.execute();
      response.fold(
        (ifLeft) => emit(
          MoviesState(
            popularMoviesState: RequestStates.error,
            popularMoviesMessage: ifLeft.message,
          ),
        ),
        (popularMovies) => emit(
          MoviesState(
            popularMoviesState: RequestStates.loaded,
            popularMovies: popularMovies,
          ),
        ),
      );
    });

    on<GetTopRatedMoviesEvent>((event, emit) async {
      final Either<Failure, List<MoviesEntity>> response =
          await getTopRatedMoviesUseCase.execute();
      response.fold(
        (ifLeft) => emit(
          MoviesState(
            topRatedMoviesState: RequestStates.error,
            topRatedMoviesMessage: ifLeft.message,
          ),
        ),
        (topRatedMovies) => emit(
          MoviesState(
            topRatedMoviesState: RequestStates.loaded,
            topRatedMovies: topRatedMovies,
          ),
        ),
      );
    });
  }
}
