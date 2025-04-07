import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_movie/domain/model/actor.dart';
import 'package:cineverse/feature_movie/domain/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetActorsUseCase implements UseCase<List<Actor>, GetActorsParams> {
  final MovieRepository _repo;

  const GetActorsUseCase(this._repo);

  @override
  Future<Either<Failure, List<Actor>>> call(GetActorsParams params) =>
      _repo.getActors(params);
}

class GetActorsParams extends Equatable {
  final int movieId;

  const GetActorsParams({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
