import 'package:cineverse/core/local/base_local_data_source.dart';
import 'package:cineverse/feature_movie/data/local/entity/actor_entity.dart';
import 'package:cineverse/feature_movie/data/local/cache/actor_cache_entity.dart';

class ActorLocalDataSource
    extends BaseLocalDataSource<ActorCacheEntity, ActorEntity> {
  ActorLocalDataSource(super.cacheBox);

  @override
  void saveEntityCache(
      String apiName, String apiKey, List<ActorEntity> entities) {
    final allCachesPages =
        cacheBox.getAll().where((e) => e.apiKey.startsWith(apiName));

    final existingActors =
        allCachesPages.expand((e) => e.actors).map((e) => e.id).toSet();

    final newActors =
        entities.where((e) => !existingActors.contains(e.id)).toList();

    var actorCache = cacheBox.get(apiKey.hashCode);

    actorCache ??= ActorCacheEntity(
      id: apiKey.hashCode,
      apiKey: apiKey,
      lastFetched: DateTime.now().millisecondsSinceEpoch,
    );

    actorCache.actors.addAll(newActors);
    cacheBox.put(actorCache);
  }
}
