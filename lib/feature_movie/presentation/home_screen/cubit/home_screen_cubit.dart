import 'package:bloc/bloc.dart';
import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/feature_movie/domain/model/movie.dart';
import 'package:cineverse/feature_movie/domain/usecase/discover_movies_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_movies_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/search_movies_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit(this._getMovies, this._searchMovies, this._discoverMovies)
      : super(const HomeScreenInitial());

  final GetMoviesUseCase _getMovies;
  final SearchMoviesUseCase _searchMovies;
  final DiscoverMoviesUseCase _discoverMovies;

  Future<void> getMovies({
    bool getPopular = true,
    bool getNowPlaying = true,
    bool getTopRated = true,
    bool getUpcoming = true,
    int popularPage = 1,
    int nowPlayingPage = 1,
    int topRatedPage = 1,
    int upcomingPage = 1,
  }) async {
    emit(HomeScreenLoading());

    bool popularResult = false;
    bool nowPlayingResult = false;
    bool topRatedResult = false;
    bool upcomingResult = false;

    if (getPopular) {
      popularResult = await _fetchMovies(
          GetMoviesParams(category: MovieCategory.popular, page: popularPage),
          "Could not get popular movies.",
          (movies) => emit(HomeScreenInitial(popular: movies)));
    }

    if (getNowPlaying) {
      nowPlayingResult = await _fetchMovies(
          GetMoviesParams(
              category: MovieCategory.nowPlaying, page: nowPlayingPage),
          "Could not get movies playing now.",
          (movies) => emit(HomeScreenInitial(nowPlaying: movies)));
    }

    if (getTopRated) {
      topRatedResult = await _fetchMovies(
          GetMoviesParams(category: MovieCategory.topRated, page: topRatedPage),
          "Could not get top rated movies.",
          (movies) => emit(HomeScreenInitial(topRated: movies)));
    }

    if (getUpcoming) {
      upcomingResult = await _fetchMovies(
          GetMoviesParams(category: MovieCategory.upcoming, page: upcomingPage),
          "Could not get upcoming movies.",
          (movies) => emit(HomeScreenInitial(upcoming: movies)));
    }

    if (popularResult || nowPlayingResult || topRatedResult || upcomingResult) {
      emit(const HomeScreenError(
        message: "Please check your internet connection.",
      ));
    }
  }

  Future<bool> _fetchMovies(GetMoviesParams params, String errorMessage,
      Function(List<Movie>) onSuccess) async {
    bool networkError = false;

    final result = await _getMovies.call(params);

    result.fold(
      (l) {
        if (l is NetworkFailure) networkError = true;
        emit(const HomeScreenInitial());
      },
      (r) {
        onSuccess(r);
      },
    );

    return networkError;
  }

  Future<void> discoverMovies(DiscoverMoviesParams params,
          [bool pageChanged = false]) async =>
      await _handleMovieFetching(
          () => _discoverMovies.call(params), false, pageChanged);

  Future<void> searchMovies(SearchMoviesParams params,
          [bool pageChanged = false]) async =>
      await _handleMovieFetching(
          () => _searchMovies.call(params), true, pageChanged);

  Future<void> _handleMovieFetching(
    Future<Either<Failure, List<Movie>>> Function() fetcher,
    bool searchOrDiscover,
    bool pageChanged,
  ) async {
    emit(HomeScreenLoading());

    final result = await fetcher();

    result.fold(
      (l) {
        if (l is ExceptionFailure) {
          emit(HomeScreenError(message: l.message));
        } else {
          emit(const HomeScreenError(message: "An error occurred."));
        }
      },
      (r) {
        print("debug results $r");

        emit(searchOrDiscover
            ? HomeScreenInitial(searchResults: r, pageChanged: pageChanged)
            : HomeScreenInitial(discoverResults: r, pageChanged: pageChanged));
      },
    );
  }
}
