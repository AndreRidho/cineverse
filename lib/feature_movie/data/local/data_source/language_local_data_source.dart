import 'package:cineverse/core/local/base_local_data_source.dart';
import 'package:cineverse/feature_movie/data/local/entity/language_entity.dart';
import 'package:cineverse/feature_movie/data/local/cache/language_cache_entity.dart';

class LanguageLocalDataSource
    extends BaseLocalDataSource<LanguageCacheEntity, LanguageEntity> {
  LanguageLocalDataSource(super.cacheBox);

  @override
  void saveEntityCache(
      String apiName, String apiKey, List<LanguageEntity> entities) {
    final allCachesPages =
        cacheBox.getAll().where((e) => e.apiKey.startsWith(apiName));

    final existingLanguages =
        allCachesPages.expand((e) => e.languages).map((e) => e.iso6391).toSet();

    final newLanguages =
        entities.where((e) => !existingLanguages.contains(e.iso6391)).toList();

    var languageCache = cacheBox.get(apiKey.hashCode);

    languageCache ??= LanguageCacheEntity(
      id: apiKey.hashCode,
      apiKey: apiKey,
      lastFetched: DateTime.now().millisecondsSinceEpoch,
    );

    languageCache.languages.addAll(newLanguages);
    cacheBox.put(languageCache);
  }
}
