import 'package:cineverse/core/local/base_cache_entity.dart';
import 'package:cineverse/feature_movie/data/local/entity/movie_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class MovieCacheEntity extends BaseCacheEntity<MovieEntity> {
  @override
  @Id(assignable: true)
  int id;

  @override
  String apiKey;

  @override
  int lastFetched;

  MovieCacheEntity({
    required this.id,
    required this.apiKey,
    required this.lastFetched,
  }) : super(id: id, apiKey: apiKey, lastFetched: lastFetched);

  @Backlink('cache')
  final ToMany<MovieEntity> movies = ToMany<MovieEntity>();
}
