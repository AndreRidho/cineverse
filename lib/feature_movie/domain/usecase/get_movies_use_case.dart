import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_movie/domain/model/movie.dart';
import 'package:cineverse/feature_movie/domain/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetMoviesUseCase implements UseCase<List<Movie>, GetMoviesParams> {
  final MovieRepository _repo;

  const GetMoviesUseCase(this._repo);

  @override
  Future<Either<Failure, List<Movie>>> call(GetMoviesParams params) =>
      _repo.getMovies(params);
}

class GetMoviesParams extends Equatable {
  final int page;
  final MovieCategory category;

  const GetMoviesParams({this.page = 1, required this.category});

  @override
  List<Object?> get props => [page, category];
}

enum MovieCategory { popular, topRated, nowPlaying, upcoming }
