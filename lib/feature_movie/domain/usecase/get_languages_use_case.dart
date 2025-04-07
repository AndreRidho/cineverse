import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_movie/domain/model/language.dart';
import 'package:cineverse/feature_movie/domain/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetLanguagesUseCase implements UseCase<List<Language>, NoParams> {
  final MovieRepository _repo;

  const GetLanguagesUseCase(this._repo);

  @override
  Future<Either<Failure, List<Language>>> call(NoParams params) =>
      _repo.getLanguages(params);
}
