import 'package:cineverse/app/splash_screen/cubit/splash_screen_cubit.dart';
import 'package:cineverse/core/routes/app_route.dart';
import 'package:cineverse/core/routes/navigation_service.dart';
import 'package:cineverse/l10n/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashScreenCubit, SplashScreenState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {},
            authenticated: (account) =>
                NavigationService.get().navigateTo(AppRoute.homeScreen),
            unauthenticated: () =>
                NavigationService.get().navigateTo(AppRoute.loginScreen),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(AppLocalizations.of(context)!.cineVerse)],
            ),
          ],
        ),
      ),
    );
  }
}
