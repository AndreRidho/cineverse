import 'package:cineverse/config/colors/colors.dart';
import 'package:cineverse/core/routes/app_route.dart';
import 'package:cineverse/core/routes/navigation_service.dart';
import 'package:cineverse/l10n/gen_l10n/app_localizations.dart';
import 'package:cineverse/util/device_info/device_info.dart';
import 'package:cineverse/widget/bottom_bar.dart';
import 'package:cineverse/widget/element_padding.dart';
import 'package:cineverse/widget/info_field.dart';
import 'package:cineverse/widget/loading.dart';
import 'package:cineverse/widget/title.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              FutureBuilder(
                future: DeviceInfoService.getDeviceInfo(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data == null) {
                    return const Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(child: Loading()),
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
