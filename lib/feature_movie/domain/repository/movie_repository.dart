import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_movie/domain/model/actor.dart';
import 'package:cineverse/feature_movie/domain/model/genre.dart';
import 'package:cineverse/feature_movie/domain/model/language.dart';
import 'package:cineverse/feature_movie/domain/model/movie.dart';
import 'package:cineverse/feature_movie/domain/usecase/edit_list_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/discover_movies_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_actors_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_genres_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_movie_details_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_movie_state_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_movies_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/search_movies_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getMovies(GetMoviesParams params);
  Future<Either<Failure, List<Movie>>> searchMovies(SearchMoviesParams params);
  Future<Either<Failure, List<Movie>>> discoverMovies(
      DiscoverMoviesParams params);
  Future<Either<Failure, List<Genre>>> getGenres(GetGenresParams params);
  Future<Either<Failure, List<Actor>>> getActors(GetActorsParams params);
  Future<Either<Failure, Movie>> getMovieDetails(GetMovieDetailsParams params);
  Future<Either<Failure, List<Language>>> getLanguages(NoParams params);
  Future<Either<Failure, void>> editList(EditListParams params);
  Future<Either<Failure, List<Movie>>> getWatchListMovies(NoParams params);
  Future<Either<Failure, bool>> getMovieState(GetMovieStateParams params);
}
