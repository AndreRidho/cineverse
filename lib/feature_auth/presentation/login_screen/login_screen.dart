import 'package:cineverse/core/routes/app_route.dart';
import 'package:cineverse/core/routes/navigation_service.dart';
import 'package:cineverse/feature_auth/domain/use_case/log_in_use_case.dart';
import 'package:cineverse/feature_auth/presentation/login_screen/cubit/login_screen_cubit.dart';
import 'package:cineverse/l10n/gen_l10n/app_localizations.dart';
import 'package:cineverse/util/mixin/dialogs.dart';
import 'package:cineverse/widget/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginScreen extends HookWidget with Dialogs {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final showPassword = useState(false);

    final username = useTextEditingController();
    final password = useTextEditingController();

    final missing = useValueListenable(username).text.isEmpty ||
        useValueListenable(password).text.isEmpty;

    return Scaffold(
      body: BlocListener<LoginScreenCubit, LoginScreenState>(
        listener: (context, state) {
          state.when(
            initial: (errorMessage) {
              if (errorMessage != null) {
                snackMessage(context, errorMessage);
              }
            },
            loading: () {},
            authenticated: (account) {
              NavigationService.get().navigateTo(AppRoute.homeScreen);
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTitle(title: AppLocalizations.of(context)!.signIn),
                      const SizedBox(height: 40),
                      TextField(
                        controller: username,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.username,
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: password,
                              obscureText: !showPassword.value,
                              decoration: InputDecoration(
                                hintText:
                                    AppLocalizations.of(context)!.password,
                                hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () =>
                                showPassword.value = !showPassword.value,
                            icon: Icon(showPassword.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      BlocBuilder<LoginScreenCubit, LoginScreenState>(
                        builder: (context, state) {
                          final loading = state.maybeWhen(
                            loading: () => true,
                            orElse: () => false,
                          );

                          return Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: missing || loading
                                      ? null
                                      : () {
                                          BlocProvider.of<LoginScreenCubit>(
                                                  context)
                                              .login(
                                            LoginParams(
                                              username: username.text,
                                              password: password.text,
                                            ),
                                          );
                                        },
                                  child:
                                      Text(AppLocalizations.of(context)!.logIn),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
