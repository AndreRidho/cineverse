import 'package:cineverse/core/routes/app_route.dart';
import 'package:cineverse/core/routes/navigation_service.dart';
import 'package:cineverse/l10n/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          switch (value) {
            case 0:
              NavigationService.get()
                  .navigateTo(AppRoute.homeScreen, popAll: true);
              break;
            case 1:
              NavigationService.get()
                  .navigateTo(AppRoute.myListScreen, popAll: true);
              break;
            case 2:
              NavigationService.get()
                  .navigateTo(AppRoute.accountScreen, popAll: true);
              break;
            default:
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_rounded),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.bookmark_rounded),
            label: AppLocalizations.of(context)!.myList,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_rounded),
            label: AppLocalizations.of(context)!.account,
          ),
        ]);
  }
}
