import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_movie/domain/model/genre.dart';
import 'package:cineverse/feature_movie/domain/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetGenresUseCase implements UseCase<List<Genre>, GetGenresParams> {
  final MovieRepository _repo;

  const GetGenresUseCase(this._repo);

  @override
  Future<Either<Failure, List<Genre>>> call(GetGenresParams params) =>
      _repo.getGenres(params);
}

class GetGenresParams extends Equatable {
  final String? language;

  const GetGenresParams({this.language});

  @override
  List<Object?> get props => [];
}
