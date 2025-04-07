class ServerException implements Exception {
  String? message;

  ServerException({this.message});
}

class CacheException implements Exception {
  CacheException();
}

class NoNetworkException implements Exception {
  NoNetworkException();
}

class UnauthenticatedException implements Exception {
  UnauthenticatedException();
}
