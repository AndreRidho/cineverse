import 'package:cineverse/core/constants/constants.dart';
import 'package:cineverse/core/di/di.dart';
import 'package:cineverse/core/routes/app_route.dart';
import 'package:cineverse/core/routes/navigation_service.dart';
import 'package:cineverse/feature_movie/presentation/my_list_screen/cubit/my_list_screen_cubit.dart';
import 'package:cineverse/l10n/gen_l10n/app_localizations.dart';
import 'package:cineverse/util/mixin/dialogs.dart';
import 'package:cineverse/widget/bottom_bar.dart';
import 'package:cineverse/widget/loading.dart';
import 'package:cineverse/widget/movie_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyListScreen extends StatelessWidget with Dialogs {
  const MyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.myList),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: const BottomBar(index: 1),
      body: BlocConsumer<MyListScreenCubit, MyListScreenState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (errorMessage) {
              snackMessage(context, errorMessage);
            },
            unauth: () async {
              final prefs = sl<SharedPreferences>();

              await prefs.remove(kSessionId);
              await prefs.remove(kAccountId);

              NavigationService.get()
                  .navigateTo(AppRoute.loginScreen, popAll: true);
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (movies) {
              return MovieResults(
                onRefresh: () =>
                    BlocProvider.of<MyListScreenCubit>(context).get(),
                onReturnFromMovie: () =>
                    BlocProvider.of<MyListScreenCubit>(context).get(),
                movies: movies,
              );
            },
            orElse: () => const Padding(
              padding: EdgeInsets.all(20),
              child: Loading(),
            ),
          );
        },
      ),
    );
  }
}
