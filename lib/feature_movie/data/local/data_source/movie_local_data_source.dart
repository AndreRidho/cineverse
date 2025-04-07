import 'package:cineverse/core/local/base_local_data_source.dart';
import 'package:cineverse/feature_movie/data/local/entity/movie_entity.dart';
import 'package:cineverse/feature_movie/data/local/cache/movie_cache_entity.dart';

class MovieLocalDataSource
    extends BaseLocalDataSource<MovieCacheEntity, MovieEntity> {
  MovieLocalDataSource(super.cacheBox);

  @override
  void saveEntityCache(
      String apiName, String apiKey, List<MovieEntity> entities) {
    final allCachesPages =
        cacheBox.getAll().where((e) => e.apiKey.startsWith(apiName));

    final existingMovies =
        allCachesPages.expand((e) => e.movies).map((e) => e.id).toSet();

    final newMovies =
        entities.where((e) => !existingMovies.contains(e.id)).toList();

    var movieCache = cacheBox.get(apiKey.hashCode);

    movieCache ??= MovieCacheEntity(
      id: apiKey.hashCode,
      apiKey: apiKey,
      lastFetched: DateTime.now().millisecondsSinceEpoch,
    );

    movieCache.movies.addAll(newMovies);
    cacheBox.put(movieCache);
  }
}
