import 'package:cineverse/config/colors/colors.dart';
import 'package:cineverse/widget/element_padding.dart';
import 'package:flutter/material.dart';

class InfoField extends StatelessWidget {
  const InfoField({super.key, required this.title, required this.text});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElementPadding(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 15)),
          Text(text, style: const TextStyle(color: blueGray))
        ],
      ),
    );
  }
}
