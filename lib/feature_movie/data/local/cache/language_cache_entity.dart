import 'package:cineverse/core/local/base_cache_entity.dart';
import 'package:cineverse/feature_movie/data/local/entity/language_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class LanguageCacheEntity extends BaseCacheEntity<LanguageEntity> {
  @override
  @Id(assignable: true)
  int id;

  @override
  String apiKey;

  @override
  int lastFetched;

  LanguageCacheEntity({
    required this.id,
    required this.apiKey,
    required this.lastFetched,
  }) : super(id: id, apiKey: apiKey, lastFetched: lastFetched);

  @Backlink('cache')
  final ToMany<LanguageEntity> languages = ToMany<LanguageEntity>();
}
