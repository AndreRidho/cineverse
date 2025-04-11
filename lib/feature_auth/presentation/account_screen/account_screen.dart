import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineverse/core/routes/app_route.dart';
import 'package:cineverse/core/routes/navigation_service.dart';
import 'package:cineverse/feature_auth/presentation/account_screen/cubit/account_screen_cubit.dart';
import 'package:cineverse/l10n/gen_l10n/app_localizations.dart';
import 'package:cineverse/util/device_info/device_info.dart';
import 'package:cineverse/widget/bottom_bar.dart';
import 'package:cineverse/widget/element_padding.dart';
import 'package:cineverse/widget/info_field.dart';
import 'package:cineverse/widget/loading.dart';
import 'package:cineverse/widget/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.account),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () =>
                NavigationService.get().navigateTo(AppRoute.settingsScreen),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      bottomNavigationBar: const BottomBar(index: 2),
      body: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<AccountScreenCubit, AccountScreenState>(
                builder: (context, state) {
                  return state.maybeWhen(
                      loaded: (account) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: account.avatarPath == null
                                  ? Icon(
                                      Icons.person_rounded,
                                      size: size.width / 3,
                                    )
                                  : CachedNetworkImage(
                                      height: size.width / 3,
                                      width: size.width / 3,
                                      imageUrl: account.avatarPath!,
                                    ),
                            ),
                            ElementPadding(
                                widget: MyTitle(
                                    title: account.name.isEmpty
                                        ? account.username
                                        : account.name)),
                            if (account.name.isNotEmpty)
                              InfoField(
                                  title: AppLocalizations.of(context)!.username,
                                  text: account.username)
                          ],
                        );
                      },
                      orElse: () => const Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Center(child: Loading()),
                              ],
                            ),
                          ));
                },
              ),
              FutureBuilder(
                future: DeviceInfoService.getDeviceInfo(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data == null) {
                    return const Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Center(child: Loading()),
                        ],
                      ),
                    );
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElementPadding(
                          widget: MyTitle(
                              title: AppLocalizations.of(context)!
                                  .deviceInformation)),
                      infoField(AppLocalizations.of(context)!.deviceModel,
                          snapshot, 'model'),
                      infoField(AppLocalizations.of(context)!.osVersion,
                          snapshot, 'osVersion'),
                      infoField(
                          AppLocalizations.of(context)!.availableStorageSpace,
                          snapshot,
                          'storage'),
                      infoField(AppLocalizations.of(context)!.batteryLevel,
                          snapshot, 'battery'),
                    ],
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget infoField(String title, snapshot, mapKey) {
    return InfoField(title: title, text: snapshot.data![mapKey]);
  }
}
