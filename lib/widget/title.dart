import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  const MyTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}
