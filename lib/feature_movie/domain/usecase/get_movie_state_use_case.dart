import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_movie/domain/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetMovieStateUseCase implements UseCase<bool, GetMovieStateParams> {
  final MovieRepository _repo;

  const GetMovieStateUseCase(this._repo);

  @override
  Future<Either<Failure, bool>> call(GetMovieStateParams params) =>
      _repo.getMovieState(params);
}

class GetMovieStateParams extends Equatable {
  final int movieId;

  const GetMovieStateParams({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
