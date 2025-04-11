import 'package:bloc/bloc.dart';
import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/use_case/use_case.dart';
import 'package:cineverse/feature_movie/domain/model/genre.dart';
import 'package:cineverse/feature_movie/domain/model/language.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_genres_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_languages_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setup_search_state.dart';
part 'setup_search_cubit.freezed.dart';

class SetupSearchCubit extends Cubit<SetupSearchState> {
  SetupSearchCubit(this._getGenres, this._getLanguages)
      : super(const SetupSearchState.loading());

  final GetGenresUseCase _getGenres;
  final GetLanguagesUseCase _getLanguages;

  Future<void> getGenresAndLanguages() async {
    emit(const SetupSearchState.loading());

    final genresResult = await _getGenres(GetGenresParams());
    final languagesResult = await _getLanguages(NoParams());

    print('debug genre cubit');

    // Check for errors
    if (genresResult.isLeft() || languagesResult.isLeft()) {
      final genreFailure = genresResult.fold((l) => l, (r) => null);
      final languageFailure = languagesResult.fold((l) => l, (r) => null);

      String? getFailureMessage(Failure? failure) {
        if (failure is ExceptionFailure) {
          return failure.message;
        }
        return null;
      }

      print('debug genre $genreFailure');
      print('debug genre $languagesResult');

      final failureMessage = getFailureMessage(genreFailure) ??
          getFailureMessage(languageFailure) ??
          "An error occurred.";

      emit(SetupSearchState.error(failureMessage));
      return;
    }

    print('debug genre success $genresResult');

    // Extract the successful results
    final genres = genresResult.getOrElse(() => []);
    final languages = languagesResult.getOrElse(() => []);

    emit(SetupSearchState.loaded(genres, languages));
  }
}
