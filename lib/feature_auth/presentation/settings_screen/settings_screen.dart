import 'package:cineverse/app/cubit/locale_cubit.dart';
import 'package:cineverse/config/colors/colors.dart';
import 'package:cineverse/l10n/gen_l10n/app_localizations.dart';
import 'package:cineverse/main.dart';
import 'package:cineverse/widget/info_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restart_app/restart_app.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          return Column(
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
                            localeOption(context, const Locale('en'), state),
                            localeOption(context, const Locale('ar'), state),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: InfoField(
                  title: 'Language',
                  text: state.locale.toString(),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget localeOption(context, Locale locale, LocaleState state) {
    final loc = AppLocalizations.of(context)!;
    final sameLocale = state.locale.languageCode == locale.languageCode;

    return InkWell(
      onTap: () {
        if (!sameLocale) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(loc.changeRestartConfirmMsg),
                actions: [
                  TextButton(
                    onPressed: pop,
                    child: Text(
                      loc.cancel,
                      style: const TextStyle(color: blueGray),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<LocaleCubit>(context)
                          .set(locale.languageCode);
                      Restart.restartApp();
                    },
                    child: Text(
                      loc.apply,
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              );
            },
          );
        }
      },
      child: Row(
        children: [
          Expanded(child: Text(locale.toString())),
          Radio<bool>(
            value: true,
            groupValue: sameLocale ? true : null,
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}
