import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_movie/domain/model/movie.dart';
import 'package:cineverse/feature_movie/domain/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SearchMoviesUseCase implements UseCase<List<Movie>, SearchMoviesParams> {
  final MovieRepository _repo;

  const SearchMoviesUseCase(this._repo);

  @override
  Future<Either<Failure, List<Movie>>> call(SearchMoviesParams params) =>
      _repo.searchMovies(params);
}

class SearchMoviesParams extends Equatable {
  final String query;
  final int? page;
  final String? language;
  final bool? includeAdult;
  final int? year;

  const SearchMoviesParams(
      {required this.query,
      this.page,
      this.language,
      this.includeAdult,
      this.year});

  @override
  List<Object?> get props => [query, page, year, language, includeAdult];
}
