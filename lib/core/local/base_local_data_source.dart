import 'package:cineverse/core/local/base_cache_entity.dart';
import 'package:objectbox/objectbox.dart';

abstract class BaseLocalDataSource<TCache extends BaseCacheEntity<T>, T> {
  final Box<TCache> cacheBox;

  BaseLocalDataSource(this.cacheBox);

  // Retrieves cache info for a specific API key
  TCache? getCache(String apiKey) {
    return cacheBox.get(apiKey.hashCode);
  }

  // Checks if cached data is still valid
  bool isCacheValid(String apiKey) {
    final cache = getCache(apiKey);
    return cache != null && cache.isValid();
  }

  // Clears cache for a specific API key
  void clearCache(String apiKey) {
    cacheBox.remove(apiKey.hashCode);
  }

  // Clears all cache entries
  void clearAllCache() {
    cacheBox.removeAll();
  }

  // Must be implemented by subclasses due to ObjectBox backlinks
  void saveEntityCache(String apiName, String apiKey, List<T> entities);
}
