import 'package:equatable/equatable.dart';

class Movie implements Equatable {
  final int id;
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String releaseDate;
  final int? runtime;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie({
    required this.id,
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        id,
        adult,
        backdropPath,
        genreIds,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        runtime,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount
      ];

  @override
  bool? get stringify => true;

  @override
  String toString() =>
      'Movie(id: $id, title: $title, releaseDate: $releaseDate)';
}
