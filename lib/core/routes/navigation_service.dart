import 'package:cineverse/core/di/di.dart';
import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(
    String routeName, {
    Object? arguments,
    bool popAndPush = false,
    bool popAll = false,
  }) {
    if (popAndPush) {
      return navigatorKey.currentState!.pushReplacementNamed(
        routeName,
        arguments: arguments,
      );
    }

    if (popAll) {
      navigatorKey.currentState!.popUntil((_) => false);
    }

    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  pop<T extends Object?>([T? result]) {
    return navigatorKey.currentState!.pop(result);
  }

  // popToBase() {
  //   return navigatorKey.currentState!.popUntil(
  //     ModalRoute.withName(DashboardRoutes.homeScreen),
  //   );
  // }

  static setupServiceLocator() {
    sl.registerLazySingleton(() => NavigationService());
  }

  static NavigationService get() => sl<NavigationService>();
}
