import 'package:cineverse/core/local/base_cache_entity.dart';
import 'package:cineverse/feature_movie/data/local/entity/actor_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ActorCacheEntity extends BaseCacheEntity<ActorEntity> {
  @override
  @Id(assignable: true)
  int id;

  @override
  String apiKey;

  @override
  int lastFetched;

  ActorCacheEntity({
    required this.id,
    required this.apiKey,
    required this.lastFetched,
  }) : super(id: id, apiKey: apiKey, lastFetched: lastFetched);

  @Backlink('cache')
  final ToMany<ActorEntity> actors = ToMany<ActorEntity>();
}
