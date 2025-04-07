import 'package:flutter/material.dart';

class ElementPadding extends StatelessWidget {
  const ElementPadding({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: widget,
    );
  }
}
