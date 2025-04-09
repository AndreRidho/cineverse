import 'package:cineverse/app/cubit/locale_cubit.dart';
import 'package:cineverse/core/constants/languages.dart';
import 'package:cineverse/core/routes/app_route.dart';
import 'package:cineverse/core/routes/navigation_service.dart';
import 'package:cineverse/feature_auth/presentation/settings_screen/cubit/settings_screen_cubit.dart';
import 'package:cineverse/l10n/gen_l10n/app_localizations.dart';
import 'package:cineverse/main.dart';
import 'package:cineverse/util/mixin/dialogs.dart';
import 'package:cineverse/widget/info_field.dart';
import 'package:cineverse/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget with Dialogs {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.settings)),
      body: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Padding(
              padding: EdgeInsets.all(20),
              child: Loading(),
            ),
            loaded: (locale) {
              return BlocListener<SettingsScreenCubit, SettingsScreenState>(
                listener: (context, state) {
                  state.when(
                    initial: (errorMessage) {
                      if (errorMessage != null) {
                        pop();
                        snackMessage(context, errorMessage);
                      }
                    },
                    loading: () => loadingDialog(context),
                    loggedOut: () => NavigationService.get().navigateTo(
                      AppRoute.loginScreen,
                      popAll: true,
                    ),
                  );
                },
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              insetPadding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  localeOption(
                                      context, const Locale('en'), locale),
                                  localeOption(
                                      context, const Locale('ar'), locale),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: InfoField(
                              title: AppLocalizations.of(context)!.language,
                              text: localeToLangName(locale),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    InkWell(
                        onTap: () {
                          alertDialog(
                            context,
                            message: 'Are you sure you want to log out?',
                            leftText: 'Cancel',
                            rightText: 'Log out',
                            rightAction: () {
                              BlocProvider.of<SettingsScreenCubit>(context)
                                  .logOut();
                            },
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Log out',
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  String localeToLangName(Locale locale) {
    final languages = Languages();

    return languages.getDisplayLanguage(locale.languageCode);
  }

  Widget localeOption(context, Locale locale, Locale stateLocale) {
    final loc = AppLocalizations.of(context)!;
    final sameLocale = stateLocale.languageCode == locale.languageCode;

    return InkWell(
      onTap: () {
        if (!sameLocale) {
          alertDialog(
            context,
            message: loc.changeRestartConfirmMsg,
            leftText: loc.cancel,
            rightText: loc.apply,
            rightAction: () {
              BlocProvider.of<LocaleCubit>(context).set(locale.languageCode);
            },
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(child: Text(localeToLangName(locale))),
            Radio<bool>(
              value: true,
              groupValue: sameLocale ? true : null,
              onChanged: (value) {},
            )
          ],
        ),
      ),
    );
  }
}
