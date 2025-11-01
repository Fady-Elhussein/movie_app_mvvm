// use case is a class responsible for encapsulating a specific piece of business logic or
// a particular operation that your application needs to perform.
// It acts as a bridge between the presentation
// layer and the data layer.

import 'package:movie_app_mvvm/movies/domain/repositories/base_movies_repository.dart';

import '../entities/movies_entity.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase({required this.baseMoviesRepository});
 Future<List<MoviesEntity>> execute() async {
  return  await baseMoviesRepository.getNowPlayingMovies();
  }
}
