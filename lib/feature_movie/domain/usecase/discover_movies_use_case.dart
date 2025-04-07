import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_movie/domain/model/movie.dart';
import 'package:cineverse/feature_movie/domain/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class DiscoverMoviesUseCase
    implements UseCase<List<Movie>, DiscoverMoviesParams> {
  final MovieRepository _repo;

  const DiscoverMoviesUseCase(this._repo);

  @override
  Future<Either<Failure, List<Movie>>> call(DiscoverMoviesParams params) =>
      _repo.discoverMovies(params);
}

class DiscoverMoviesParams extends Equatable {
  final int? page;
  final String? language;
  final String? region;
  final List<int>? genres;
  final double? voteAverageMin;
  final double? voteAverageMax;
  final int? voteCountMin;
  final int? voteCountMax;
  final String? sortBy;
  final int? year;
  final int? primaryReleaseYear;
  final bool? includeAdult;
  final bool? includeVideo;

  const DiscoverMoviesParams({
    this.page,
    this.language,
    this.region,
    this.genres,
    this.voteAverageMin,
    this.voteAverageMax,
    this.voteCountMin,
    this.voteCountMax,
    this.sortBy,
    this.year,
    this.primaryReleaseYear,
    this.includeAdult,
    this.includeVideo,
  });

  @override
  List<Object?> get props => [
        page,
        language,
        region,
        genres,
        voteAverageMin,
        voteAverageMax,
        voteCountMin,
        voteCountMax,
        sortBy,
        year,
        primaryReleaseYear,
        includeAdult,
        includeVideo,
      ];
}
