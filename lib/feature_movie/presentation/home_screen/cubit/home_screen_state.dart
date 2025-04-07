part of 'home_screen_cubit.dart';

sealed class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object?> get props => [];
}

final class HomeScreenInitial extends HomeScreenState {
  final List<Movie>? popular;
  final List<Movie>? upcoming;
  final List<Movie>? nowPlaying;
  final List<Movie>? topRated;
  final List<Movie>? searchResults;
  final List<Movie>? discoverResults;
  final bool? pageChanged;

  const HomeScreenInitial({
    this.popular,
    this.upcoming,
    this.nowPlaying,
    this.topRated,
    this.searchResults,
    this.discoverResults,
    this.pageChanged,
  });

  @override
  List<Object?> get props => [
        popular,
        upcoming,
        nowPlaying,
        topRated,
        searchResults,
        discoverResults,
        pageChanged
      ];
}

final class HomeScreenLoading extends HomeScreenState {}

final class HomeScreenError extends HomeScreenState {
  final String message;

  const HomeScreenError({required this.message});

  @override
  List<Object> get props => [message];
}
