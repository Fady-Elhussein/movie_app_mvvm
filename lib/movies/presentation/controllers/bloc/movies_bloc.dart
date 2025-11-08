import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app_mvvm/core/utiles/enumes.dart';
import 'package:movie_app_mvvm/movies/presentation/controllers/bloc/movies_event.dart';
import 'package:movie_app_mvvm/movies/presentation/controllers/bloc/movies_state.dart';
import '../../../../core/error/failure.dart';
import '../../../domain/entities/movies_entity.dart';
import '../../../domain/usecases/get_now_playing_movies_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  MoviesBloc({required this.getNowPlayingMoviesUseCase})
    : super(MoviesState()) { 
    on<GetNowPlayingMovies>((event, emit) async {
      final Either<Failure, List<MoviesEntity>> response =
          await getNowPlayingMoviesUseCase.execute();
      response.fold(
        (ifLeft) => emit(
          MoviesState(
            nowPlayingMoviesState: RequestStates.error,
            message: ifLeft.message,
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
  }
}
