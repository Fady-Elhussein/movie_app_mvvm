import 'package:equatable/equatable.dart';

class MoviesEntity extends Equatable {
  final int id;
  final double voteAverage;
  final String releaseDate;
  final String title;
  final String backdropPath;
  final String overview;
  final List<int> genreIds;

  const MoviesEntity({
    required this.id,
    required this.voteAverage,
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.genreIds,
    required this.releaseDate,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    title,
    voteAverage,
    backdropPath,
    overview,
    genreIds,
    releaseDate,
  ];
}
