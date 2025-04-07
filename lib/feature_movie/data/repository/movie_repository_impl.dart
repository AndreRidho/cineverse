import 'package:cineverse/core/error/exceptions.dart';
import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/util/mixin/data_source_factory.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_movie/data/local/data_source/actor_local_data_source.dart';
import 'package:cineverse/feature_movie/data/local/data_source/genre_local_data_source.dart';
import 'package:cineverse/feature_movie/data/local/data_source/language_local_data_source.dart';
import 'package:cineverse/feature_movie/data/local/entity/actor_entity.dart';
import 'package:cineverse/feature_movie/data/local/entity/genre_entity.dart';
import 'package:cineverse/feature_movie/data/local/entity/language_entity.dart';
import 'package:cineverse/feature_movie/data/local/entity/movie_entity.dart';
import 'package:cineverse/feature_movie/data/local/data_source/movie_local_data_source.dart';
import 'package:cineverse/feature_movie/data/remote/dto/actor/actor_dto.dart';
import 'package:cineverse/feature_movie/data/remote/dto/genre/genre_dto.dart';
import 'package:cineverse/feature_movie/data/remote/dto/language/language_dto.dart';
import 'package:cineverse/feature_movie/data/remote/dto/movie/movie_dto.dart';
import 'package:cineverse/feature_movie/data/remote/movie_remote_data_source.dart';
import 'package:cineverse/feature_movie/domain/model/actor.dart';
import 'package:cineverse/feature_movie/domain/model/genre.dart';
import 'package:cineverse/feature_movie/domain/model/language.dart';
import 'package:cineverse/feature_movie/domain/model/movie.dart';
import 'package:cineverse/feature_movie/domain/repository/movie_repository.dart';
import 'package:cineverse/feature_movie/domain/usecase/discover_movies_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_actors_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_genres_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_movie_details_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_movies_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/search_movies_use_case.dart';
import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl with DataSourceFactory implements MovieRepository {
  final MovieRemoteDataSource _remote;
  final MovieLocalDataSource _movieLocal;
  final GenreLocalDataSource _genreLocal;
  final ActorLocalDataSource _actorLocal;
  final LanguageLocalDataSource _languageLocal;

  MovieRepositoryImpl(
      {required MovieRemoteDataSource remote,
      required MovieLocalDataSource movieLocal,
      required GenreLocalDataSource genreLocal,
      required ActorLocalDataSource actorLocal,
      required LanguageLocalDataSource languageLocal})
      : _remote = remote,
        _movieLocal = movieLocal,
        _genreLocal = genreLocal,
        _actorLocal = actorLocal,
        _languageLocal = languageLocal;

  @override
  Future<Either<Failure, List<Movie>>> getMovies(GetMoviesParams params) async {
    return dataSourceFactory<MovieDto, MovieEntity, Movie>(
      apiName: 'get${params.category}Movies',
      paramsString: params.toString(),
      checkCacheValidity: _movieLocal.isCacheValid,
      local: (apiKey) {
        final cache = _movieLocal.getCache(apiKey);

        if (cache == null) throw CacheException();

        return Right(cache.movies.map((e) => e.toModel()).toList());
      },
      clear: _movieLocal.clearCache,
      remote: (apiKey) async {
        dynamic result;

        switch (params.category) {
          case MovieCategory.topRated:
            result = await _remote.getTopRatedMovies(page: params.page);
            break;
          case MovieCategory.nowPlaying:
            result = await _remote.getNowPlayingMovies(page: params.page);
            break;
          case MovieCategory.upcoming:
            result = await _remote.getUpcomingMovies(page: params.page);
            break;
          default:
            result = await _remote.getPopularMovies(page: params.page);
            break;
        }

        return (result['results'] as List)
            .map((e) => MovieDto.fromJson(e))
            .toList();
      },
      toEntity: (e) => e.toEntity(),
      save: _movieLocal.saveEntityCache,
    );
  }

  @override
  Future<Either<Failure, List<Movie>>> discoverMovies(
      DiscoverMoviesParams params) async {
    return dataSourceFactory<MovieDto, MovieEntity, Movie>(
      apiName: 'discoverMovies',
      paramsString: params.toString(),
      checkCacheValidity: _movieLocal.isCacheValid,
      local: (apiKey) {
        final cache = _movieLocal.getCache(apiKey);

        if (cache == null) throw CacheException();

        return Right(cache.movies.map((e) => e.toModel()).toList());
      },
      clear: _movieLocal.clearCache,
      remote: (apiKey) async {
        dynamic result;

        result = await _remote.discoverMovies(
          language: params.language,
          sortBy: params.sortBy,
          includeAdult: params.includeAdult,
          page: params.page,
          withGenres: params.genres?.join(','),
          year: params.year,
        );

        return (result['results'] as List)
            .map((e) => MovieDto.fromJson(e))
            .toList();
      },
      toEntity: (e) => e.toEntity(),
      save: _movieLocal.saveEntityCache,
    );
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(SearchMoviesParams params) {
    return dataSourceFactory<MovieDto, MovieEntity, Movie>(
      apiName: 'searchMovies${params.query}',
      paramsString: params.toString(),
      checkCacheValidity: _movieLocal.isCacheValid,
      local: (apiKey) {
        print("debug local a");
        final cache = _movieLocal.getCache(apiKey);
        print("debug local b");

        if (cache == null) throw CacheException();
        print("debug local c ${cache.movies}");

        return Right(cache.movies.map((e) => e.toModel()).toList());
      },
      clear: _movieLocal.clearCache,
      remote: (apiKey) async {
        dynamic result;

        result = await _remote.searchMovies(
          query: params.query,
          language: params.language,
          page: params.page,
          includeAdult: params.includeAdult,
          year: params.year,
        );

        print('debug repo ${result['results']}');

        return (result['results'] as List)
            .map((e) => MovieDto.fromJson(e))
            .toList();
      },
      toEntity: (e) => e.toEntity(),
      save: _movieLocal.saveEntityCache,
    );
  }

  @override
  Future<Either<Failure, List<Genre>>> getGenres(GetGenresParams params) async {
    return dataSourceFactory<GenreDto, GenreEntity, Genre>(
      apiName: 'getGenres',
      paramsString: params.toString(),
      checkCacheValidity: _genreLocal.isCacheValid,
      local: (apiKey) {
        final cache = _genreLocal.getCache(apiKey);

        if (cache == null) throw CacheException();

        return Right(cache.genres.map((e) => e.toModel()).toList());
      },
      clear: _genreLocal.clearCache,
      remote: (apiKey) async {
        print("debug remote a");
        dynamic result;

        result = await _remote.getMovieGenres(language: params.language);

        print("debug remote b");
        return (result['genres'] as List).map((e) {
          print("debug remote c");
          final genre = GenreDto.fromJson(e);
          print("debug remote d");
          return genre;
        }).toList();
      },
      toEntity: (e) => e.toEntity(),
      save: _genreLocal.saveEntityCache,
    );
  }

  @override
  Future<Either<Failure, List<Language>>> getLanguages(NoParams params) async {
    return dataSourceFactory<LanguageDto, LanguageEntity, Language>(
      apiName: 'searchLanguages',
      paramsString: params.toString(),
      checkCacheValidity: _languageLocal.isCacheValid,
      local: (apiKey) {
        final cache = _languageLocal.getCache(apiKey);

        if (cache == null) throw CacheException();

        return Right(cache.languages.map((e) => e.toModel()).toList());
      },
      clear: _languageLocal.clearCache,
      remote: (apiKey) async {
        dynamic result;

        result = await _remote.getLanguages();

        return (result as List).map((e) => LanguageDto.fromJson(e)).toList();
      },
      toEntity: (e) => e.toEntity(),
      save: _languageLocal.saveEntityCache,
    );
  }

  @override
  Future<Either<Failure, List<Actor>>> getActors(GetActorsParams params) async {
    return dataSourceFactory<ActorDto, ActorEntity, Actor>(
      apiName: 'getActors',
      paramsString: params.toString(),
      checkCacheValidity: _actorLocal.isCacheValid,
      local: (apiKey) {
        final cache = _actorLocal.getCache(apiKey);

        if (cache == null) throw CacheException();

        return Right(cache.actors.map((e) => e.toModel()).toList());
      },
      clear: _actorLocal.clearCache,
      remote: (apiKey) async {
        dynamic result;

        result = await _remote.getMovieCredits(movieId: params.movieId);

        return (result['cast'] as List)
            .map((e) => ActorDto.fromJson(e))
            .toList();
      },
      toEntity: (e) => e.toEntity(),
      save: _actorLocal.saveEntityCache,
    );
  }

  @override
  Future<Either<Failure, Movie>> getMovieDetails(
      GetMovieDetailsParams params) async {
    return singleDataSourceFactory<MovieDto, MovieEntity, Movie>(
      apiName: 'getMovieDetails',
      paramsString: params.toString(),
      checkCacheValidity: _movieLocal.isCacheValid,
      local: (apiKey) {
        final cache = _movieLocal.getCache(apiKey);

        return cache?.movies
            .firstWhereOrNull((e) => e.id == params.movieId)
            ?.toModel();
      },
      clear: _actorLocal.clearCache,
      remote: (apiKey) async {
        dynamic result;

        result = await _remote.getMovieCredits(movieId: params.movieId);

        return MovieDto.fromJson(result);
      },
      toEntity: (e) => e.toEntity(),
      save: _movieLocal.saveEntityCache,
    );
  }
}
