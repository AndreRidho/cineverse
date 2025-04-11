import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_movie/domain/model/movie.dart';
import 'package:cineverse/feature_movie/domain/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetWatchListMoviesUseCase implements UseCase<List<Movie>, NoParams> {
  final MovieRepository _repo;

  const GetWatchListMoviesUseCase(this._repo);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) =>
      _repo.getWatchListMovies(params);
}
