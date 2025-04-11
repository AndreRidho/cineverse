import 'package:bloc/bloc.dart';
import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/feature_movie/domain/model/actor.dart';
import 'package:cineverse/feature_movie/domain/model/genre.dart';
import 'package:cineverse/feature_movie/domain/model/movie.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_actors_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_genres_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_movie_details_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_screen_state.dart';
part 'movie_screen_cubit.freezed.dart';

class MovieScreenCubit extends Cubit<MovieScreenState> {
  MovieScreenCubit(this._getActors, this._getMovieDetails, this._getGenres)
      : super(const MovieScreenState.loading());

  final GetActorsUseCase _getActors;
  final GetMovieDetailsUseCase _getMovieDetails;
  final GetGenresUseCase _getGenres;

  Future<void> getActorsAndDetails(int movieId) async {
    emit(const MovieScreenState.loading());

    final getActorsResult = await _getActors(GetActorsParams(movieId: movieId));
    final getMoviesDetailsResult =
        await _getMovieDetails(GetMovieDetailsParams(movieId: movieId));
    final getGenresResult = await _getGenres(GetGenresParams());

    final actors = getActorsResult.fold((l) => null, (r) => r);
    print('debug cubit actors $actors');
    final details = getMoviesDetailsResult.fold((l) => null, (r) => r);
    final genres = getGenresResult.fold((l) => null, (r) => r);

    emit(MovieScreenState.loaded(actors, details, genres));
  }
}
