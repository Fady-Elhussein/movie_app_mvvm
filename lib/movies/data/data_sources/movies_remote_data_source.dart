import 'package:dio/dio.dart';
import 'package:movie_app_mvvm/core/network/error_message_model.dart';
import 'package:movie_app_mvvm/core/utiles/app_constants.dart';
import 'package:movie_app_mvvm/movies/data/models/movies_model.dart';

import '../../../core/error/exceptions.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  Dio dio = Dio();
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    try {
      Response response = await dio.get(AppConstants.nowPlayingMoviesPath);
      if (response.statusCode == 200) {
        return List<MoviesModel>.from(
          (response.data["results"] as List).map(
            (e) => MoviesModel.fromJson(e),
          ),
        );
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    try {
      Response response = await dio.get(AppConstants.topRatedMoviesPath);
      if (response.statusCode == 200) {
        return List<MoviesModel>.from(
          (response.data["results"] as List).map(
            (e) => MoviesModel.fromJson(e),
          ),
        );
      } else {
        throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    try {
      Response response = await dio.get(AppConstants.popularMoviesPath);
      if (response.statusCode == 200) {
        return List<MoviesModel>.from(
          (response.data["results"] as List).map(
            (e) => MoviesModel.fromJson(e),
          ),
        );
      } else {
        throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
