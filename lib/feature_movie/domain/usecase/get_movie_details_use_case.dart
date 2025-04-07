import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_movie/domain/model/movie.dart';
import 'package:cineverse/feature_movie/domain/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetMovieDetailsUseCase implements UseCase<Movie, GetMovieDetailsParams> {
  final MovieRepository _repo;

  const GetMovieDetailsUseCase(this._repo);

  @override
  Future<Either<Failure, Movie>> call(GetMovieDetailsParams params) =>
      _repo.getMovieDetails(params);
}

class GetMovieDetailsParams extends Equatable {
  final int movieId;

  const GetMovieDetailsParams({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
