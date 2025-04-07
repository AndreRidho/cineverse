import 'package:cineverse/app/app.dart';
import 'package:cineverse/core/routes/navigation_service.dart';
import 'package:cineverse/core/di/di.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServiceLocator();

  NavigationService.setupServiceLocator();

  runApp(const App());
}

pop({args}) => NavigationService.get().pop(args);
