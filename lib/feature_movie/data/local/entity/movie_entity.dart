import 'package:cineverse/feature_movie/data/local/cache/movie_cache_entity.dart';
import 'package:cineverse/feature_movie/domain/model/movie.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class MovieEntity {
  @Id()
  int objectboxId = 0;

  int id;
  bool adult;
  String? backdropPath;
  String genreIds;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  int? runtime;

  MovieEntity({
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

  final ToOne<MovieCacheEntity> cache = ToOne<MovieCacheEntity>();

  Movie toModel() {
    List<int> parsedGenreIds;

    if (genreIds.isEmpty) {
      parsedGenreIds = [];
    } else {
      parsedGenreIds = genreIds.split(',').map(int.parse).toList();
    }

    return Movie(
      id: id,
      adult: adult,
      backdropPath: backdropPath,
      genreIds: parsedGenreIds,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      releaseDate: releaseDate,
      title: title,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
      runtime: runtime,
    );
  }
}
