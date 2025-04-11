import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_movie/domain/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class EditListUseCase implements UseCase<void, EditListParams> {
  final MovieRepository _repo;

  const EditListUseCase(this._repo);

  @override
  Future<Either<Failure, void>> call(EditListParams params) =>
      _repo.editList(params);
}

class EditListParams extends Equatable {
  final int movieId;
  final bool addOrRemove;

  const EditListParams({required this.movieId, required this.addOrRemove});

  @override
  List<Object?> get props => [movieId, addOrRemove];
}
