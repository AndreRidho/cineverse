import 'package:cineverse/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_remote_data_source.g.dart';

@RestApi()
abstract class MovieRemoteDataSource {
  factory MovieRemoteDataSource(
    Dio dio, {
    String baseUrl,
  }) = _MovieRemoteDataSource;

  @GET('/account/{account_id}/watchlist/movies')
  Future getWatchlistMovies({
    @Path('account_id') required String accountId,
    @Query('session_id') required String sessionId,
    @Query('language') String language = "en-US",
    @Query('sort_by') String sortBy = "created_at.asc",
    @Query('page') int page = 1,
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  @POST('/account/{account_id}/watchlist')
  Future addToWatchlist({
    @Path('account_id') required String accountId,
    @Query('session_id') required String sessionId,
    @Body() required Map<String, dynamic> watchlistData,
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  @GET('/account/{account_id}/favorite/movies')
  Future getFavoriteMovies({
    @Path('account_id') required String accountId,
    @Query('session_id') required String sessionId,
    @Query('language') String language = "en-US",
    @Query('sort_by') String sortBy = "created_at.asc",
    @Query('page') int page = 1,
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  @POST('/account/{account_id}/favorite')
  Future markAsFavorite({
    @Path('account_id') required String accountId,
    @Query('session_id') required String sessionId,
    @Body() required Map<String, dynamic> favoriteData,
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  @GET('/movie/{movie_id}/account_states')
  Future getAccountStates(
    @Path('movie_id') int movieId, {
    @Query('api_key') String apiKey = kApiKey,
    @Query('session_id') required String sessionId,
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  // Movies - Home Screen
  @GET('/movie/popular')
  Future getPopularMovies({
    @Query('language') String language = "en-US",
    @Query('page') int page = 1,
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  @GET('/movie/top_rated')
  Future getTopRatedMovies({
    @Query('language') String language = "en-US",
    @Query('page') int page = 1,
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  @GET('/movie/now_playing')
  Future getNowPlayingMovies({
    @Query('language') String language = "en-US",
    @Query('page') int page = 1,
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  @GET('/movie/upcoming')
  Future getUpcomingMovies({
    @Query('language') String language = "en-US",
    @Query('page') int page = 1,
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  // Movies - Movie Details
  @GET('/movie/{movie_id}')
  Future getMovieDetails({
    @Path('movie_id') required int movieId,
    @Query('language') String language = "en-US",
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  @GET('/movie/{movie_id}/credits')
  Future getMovieCredits({
    @Path('movie_id') required int movieId,
    @Query('language') String language = "en-US",
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  @GET('/movie/{movie_id}/videos')
  Future getMovieVideos({
    @Path('movie_id') required int movieId,
    @Query('language') String language = "en-US",
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  @GET('/movie/{movie_id}/similar')
  Future getSimilarMovies({
    @Path('movie_id') required int movieId,
    @Query('language') String language = "en-US",
    @Query('page') int page = 1,
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  @GET('/movie/{movie_id}/reviews')
  Future getMovieReviews({
    @Path('movie_id') required int movieId,
    @Query('language') String language = "en-US",
    @Query('page') int page = 1,
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  @GET('/movie/{movie_id}/recommendations')
  Future getMovieRecommendations({
    @Path('movie_id') required int movieId,
    @Query('language') String language = "en-US",
    @Query('page') int page = 1,
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  @POST('/movie/{movie_id}/rating')
  Future rateMovie({
    @Path('movie_id') required int movieId,
    @Query('session_id') required String sessionId,
    @Body() required Map<String, dynamic> rating,
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  // Search & Discover
  @GET('/search/movie')
  Future searchMovies({
    @Query('query') required String query,
    @Query('language') String? language,
    @Query('page') int? page,
    @Query('include_adult') bool? includeAdult,
    @Query('year') int? year,
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  @GET('/discover/movie')
  Future discoverMovies({
    @Query('language') String? language = "en-US",
    @Query('sort_by') String? sortBy = "popularity.desc",
    @Query('include_adult') bool? includeAdult,
    @Query('include_video') bool? includeVideo,
    @Query('page') int? page = 1,
    @Query('with_genres') String? withGenres,
    @Query('year') int? year,
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  @GET('/genre/movie/list')
  Future getMovieGenres({
    @Query('language') String language = "en-US",
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  // Configuration
  @GET('/configuration')
  Future getApiConfiguration();

  @GET('/configuration/languages')
  Future getLanguages({
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  @GET('/configuration/countries')
  Future getCountries();

  @GET('/configuration/timezones')
  Future getTimezones();
}
