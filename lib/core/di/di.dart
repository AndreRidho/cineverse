import 'package:cineverse/app/cubit/locale_cubit.dart';
import 'package:cineverse/app/splash_screen/cubit/splash_screen_cubit.dart';
import 'package:cineverse/core/di/dio_di_helper.dart';
import 'package:cineverse/core/local/objectbox_db.dart';
import 'package:cineverse/feature_auth/data/remote/auth_remote_data_source.dart';
import 'package:cineverse/feature_auth/data/repository/auth_repository_impl.dart';
import 'package:cineverse/feature_auth/domain/repository/auth_repository.dart';
import 'package:cineverse/feature_auth/domain/use_case/get_account_use_case.dart';
import 'package:cineverse/feature_auth/domain/use_case/log_in_use_case.dart';
import 'package:cineverse/feature_auth/domain/use_case/log_out_use_case.dart';
import 'package:cineverse/feature_auth/presentation/login_screen/cubit/login_screen_cubit.dart';
import 'package:cineverse/feature_auth/presentation/settings_screen/cubit/settings_screen_cubit.dart';
import 'package:cineverse/feature_movie/data/local/cache/actor_cache_entity.dart';
import 'package:cineverse/feature_movie/data/local/cache/genre_cache_entity.dart';
import 'package:cineverse/feature_movie/data/local/cache/language_cache_entity.dart';
import 'package:cineverse/feature_movie/data/local/cache/movie_cache_entity.dart';
import 'package:cineverse/feature_movie/data/local/data_source/actor_local_data_source.dart';
import 'package:cineverse/feature_movie/data/local/data_source/genre_local_data_source.dart';
import 'package:cineverse/feature_movie/data/local/data_source/language_local_data_source.dart';
import 'package:cineverse/feature_movie/data/local/data_source/movie_local_data_source.dart';
import 'package:cineverse/feature_movie/data/remote/movie_remote_data_source.dart';
import 'package:cineverse/feature_movie/data/repository/movie_repository_impl.dart';
import 'package:cineverse/feature_movie/domain/repository/movie_repository.dart';
import 'package:cineverse/feature_movie/domain/usecase/discover_movies_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_actors_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_genres_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_languages_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_movie_details_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/get_movies_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/search_movies_use_case.dart';
import 'package:cineverse/feature_movie/presentation/home_screen/cubit/home_screen_cubit.dart';
import 'package:cineverse/feature_movie/presentation/home_screen/cubit/setup_search_cubit.dart';
import 'package:cineverse/feature_movie/presentation/movie_screen/cubit/movie_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:objectbox/objectbox.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;

Future<void> initServiceLocator({
  isUnitTest = false,
}) async {
  if (isUnitTest) {
    WidgetsFlutterBinding.ensureInitialized();
    sl.reset();
  }

  final sharedPrefs = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPrefs);

  // Dio client
  DioDiHelper().registerLazySingleton(sl);

  final database = await ObjectBoxDatabase.getInstance();
  sl.registerSingleton<ObjectBoxDatabase>(database);

  objectBoxes(sl);
  remoteDataSources(sl);
  localDataSources(sl);
  repositories(sl);
  useCases(sl);
  blocs(sl);
}

void objectBoxes(GetIt sl) {
  final movieBox = sl<ObjectBoxDatabase>().store.box<MovieCacheEntity>();
  sl.registerLazySingleton<Box<MovieCacheEntity>>(() => movieBox);

  final actorBox = sl<ObjectBoxDatabase>().store.box<ActorCacheEntity>();
  sl.registerLazySingleton<Box<ActorCacheEntity>>(() => actorBox);

  final genreBox = sl<ObjectBoxDatabase>().store.box<GenreCacheEntity>();
  sl.registerLazySingleton<Box<GenreCacheEntity>>(() => genreBox);

  final languageBox = sl<ObjectBoxDatabase>().store.box<LanguageCacheEntity>();
  sl.registerLazySingleton<Box<LanguageCacheEntity>>(() => languageBox);
}

void remoteDataSources(GetIt sl) {
  sl.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSource(sl()),
  );
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(sl()),
  );
}

void localDataSources(GetIt sl) {
  sl.registerLazySingleton<MovieLocalDataSource>(
    () => MovieLocalDataSource(sl()),
  );
  sl.registerLazySingleton<ActorLocalDataSource>(
    () => ActorLocalDataSource(sl()),
  );
  sl.registerLazySingleton<GenreLocalDataSource>(
    () => GenreLocalDataSource(sl()),
  );
  sl.registerLazySingleton<LanguageLocalDataSource>(
    () => LanguageLocalDataSource(sl()),
  );
}

void repositories(GetIt sl) {
  sl.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remote: sl(),
      movieLocal: sl(),
      genreLocal: sl(),
      actorLocal: sl(),
      languageLocal: sl(),
    ),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remote: sl(), prefs: sl()),
  );
}

void useCases(GetIt sl) {
  sl.registerLazySingleton(() => GetMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetActorsUseCase(sl()));
  sl.registerLazySingleton(() => GetLanguagesUseCase(sl()));
  sl.registerLazySingleton(() => SearchMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetGenresUseCase(sl()));
  sl.registerLazySingleton(() => DiscoverMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => GetAccountUseCase(sl()));
  sl.registerLazySingleton(() => LogOutUseCase(sl()));
}

void blocs(GetIt sl) {
  sl.registerFactory(() => LocaleCubit(sl()));
  sl.registerFactory(() => HomeScreenCubit(sl(), sl(), sl()));
  sl.registerFactory(() => SetupSearchCubit(sl(), sl()));
  sl.registerFactory(() => MovieScreenCubit(sl(), sl(), sl()));
  sl.registerFactory(() => SplashScreenCubit(sl()));
  sl.registerFactory(() => LoginScreenCubit(sl(), sl()));
  sl.registerFactory(() => SettingsScreenCubit(sl()));
}
