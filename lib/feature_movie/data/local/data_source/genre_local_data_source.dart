import 'package:cineverse/core/local/base_local_data_source.dart';
import 'package:cineverse/feature_movie/data/local/entity/genre_entity.dart';
import 'package:cineverse/feature_movie/data/local/cache/genre_cache_entity.dart';

class GenreLocalDataSource
    extends BaseLocalDataSource<GenreCacheEntity, GenreEntity> {
  GenreLocalDataSource(super.cacheBox);

  @override
  void saveEntityCache(
      String apiName, String apiKey, List<GenreEntity> entities) {
    final allCachesPages =
        cacheBox.getAll().where((e) => e.apiKey.startsWith(apiName));

    final existingGenres =
        allCachesPages.expand((e) => e.genres).map((e) => e.id).toSet();

    print('debug genre ds existingGenres $existingGenres');

    final newGenres =
        entities.where((e) => !existingGenres.contains(e.id)).toList();

    print('debug genre ds newGenres $newGenres');

    var genreCache = cacheBox.get(apiKey.hashCode);

    genreCache ??= GenreCacheEntity(
      id: apiKey.hashCode,
      apiKey: apiKey,
      lastFetched: DateTime.now().millisecondsSinceEpoch,
    );

    genreCache.genres.addAll(newGenres);
    cacheBox.put(genreCache);
  }
}
