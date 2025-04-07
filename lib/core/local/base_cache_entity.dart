abstract class BaseCacheEntity<T> {
  int id;
  String apiKey;
  int lastFetched;

  BaseCacheEntity({
    required this.id,
    required this.apiKey,
    required this.lastFetched,
  });

  /// Checks if the cache is still valid (within 30 seconds)
  bool isValid() {
    return DateTime.now().millisecondsSinceEpoch - lastFetched < 30000;
  }
}
