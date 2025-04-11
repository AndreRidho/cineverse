import 'package:cineverse/app/splash_screen/cubit/splash_screen_cubit.dart';
import 'package:cineverse/app/splash_screen/splash_screen.dart';
import 'package:cineverse/core/di/di.dart';
import 'package:cineverse/feature_auth/presentation/account_screen/account_screen.dart';
import 'package:cineverse/feature_auth/presentation/account_screen/cubit/account_screen_cubit.dart';
import 'package:cineverse/feature_auth/presentation/login_screen/cubit/login_screen_cubit.dart';
import 'package:cineverse/feature_auth/presentation/login_screen/login_screen.dart';
import 'package:cineverse/feature_auth/presentation/settings_screen/cubit/settings_screen_cubit.dart';
import 'package:cineverse/feature_auth/presentation/settings_screen/settings_screen.dart';
import 'package:cineverse/feature_movie/domain/model/movie.dart';
import 'package:cineverse/feature_movie/presentation/home_screen/cubit/home_screen_cubit.dart';
import 'package:cineverse/feature_movie/presentation/home_screen/home_screen.dart';
import 'package:cineverse/feature_movie/presentation/movie_screen/cubit/movie_screen_cubit.dart';
import 'package:cineverse/feature_movie/presentation/movie_screen/movie_screen.dart';
import 'package:cineverse/feature_movie/presentation/my_list_screen/cubit/my_list_screen_cubit.dart';
import 'package:cineverse/feature_movie/presentation/my_list_screen/my_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  static const splashScreen = '/';
  static const homeScreen = '/home';
  static const loginScreen = '/login';
  static const movieScreen = '/movie';
  static const accountScreen = '/account';
  static const myListScreen = '/my_list';
  static const settingsScreen = '/settings';

  final _splashRoute = MaterialPageRoute(
    builder: (context) {
      return BlocProvider(
        create: (context) => sl<SplashScreenCubit>()..checkAccount(),
        child: const SplashScreen(),
      );
    },
  );

  final _loginRoute = MaterialPageRoute(
    builder: (context) {
      return BlocProvider(
        create: (context) => sl<LoginScreenCubit>(),
        child: const LoginScreen(),
      );
    },
  );

  final _settingsRoute = MaterialPageRoute(
    builder: (context) {
      return BlocProvider(
        create: (context) => sl<SettingsScreenCubit>(),
        child: const SettingsScreen(),
      );
    },
  );

  final _homeRoute = MaterialPageRoute(
    builder: (context) {
      return BlocProvider<HomeScreenCubit>(
        create: (context) => sl<HomeScreenCubit>()..getMovies(),
        child: const HomeScreen(),
      );
    },
  );

  final _accountRoute = MaterialPageRoute(
    builder: (context) {
      return BlocProvider<AccountScreenCubit>(
        create: (context) => sl<AccountScreenCubit>()..get(),
        child: const AccountScreen(),
      );
    },
  );

  final _myListRoute = MaterialPageRoute(
    builder: (context) {
      return BlocProvider<MyListScreenCubit>(
        create: (context) => sl<MyListScreenCubit>()..get(),
        child: const MyListScreen(),
      );
    },
  );

  Route _movieRoute(Movie movie) => MaterialPageRoute(
        builder: (context) {
          return BlocProvider(
            create: (context) =>
                sl<MovieScreenCubit>()..getActorsAndDetails(movie.id),
            child: MovieScreen(
              movie: movie,
            ),
          );
        },
      );

  static Route? onGenerateRoutes(RouteSettings settings) {
    final appRoute = AppRoute();

    final args = settings.arguments as List?;

    switch (settings.name) {
      case homeScreen:
        return appRoute._homeRoute;
      case loginScreen:
        return appRoute._loginRoute;
      case accountScreen:
        return appRoute._accountRoute;
      case movieScreen:
        return appRoute._movieRoute(args![0]);
      case myListScreen:
        return appRoute._myListRoute;
      case settingsScreen:
        return appRoute._settingsRoute;

      default:
        return appRoute._splashRoute;
    }
  }
}
