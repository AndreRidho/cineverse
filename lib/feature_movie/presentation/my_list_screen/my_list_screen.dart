import 'package:cineverse/l10n/gen_l10n/app_localizations.dart';
import 'package:cineverse/widget/bottom_bar.dart';
import 'package:flutter/material.dart';

class MyListScreen extends StatelessWidget {
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
    );
  }
}
