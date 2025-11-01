import 'package:movie_app_mvvm/movies/domain/entities/movies_entity.dart';

class MoviesModel extends MoviesEntity {
  const MoviesModel({
    required super.id,
    required super.voteAverage,
    required super.title,
    required super.backdropPath,
    required super.overview,
    required super.genreIds,
    required super.releaseDate,
  });
  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      id: json["id"],
      voteAverage: json["vote_average"],
      title: json["title"],
      backdropPath: json["backdrop_path"],
      overview: json["overview"],
      genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      releaseDate: json["release_date"],
    );
  }
}
