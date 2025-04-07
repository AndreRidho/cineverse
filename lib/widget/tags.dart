import 'package:cineverse/config/colors/colors.dart';
import 'package:flutter/material.dart';

class TagRow extends StatelessWidget {
  const TagRow({super.key, required this.tags, this.paddingY = 20});

  final List<Tag> tags;
  final double paddingY;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: paddingY),
      child: Row(
        children: [
          Expanded(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: tags,
            ),
          ),
        ],
      ),
    );
  }
}

class Tag extends StatelessWidget {
  const Tag({super.key, required this.text, this.closeFunction});

  final String text;
  final Function()? closeFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 15),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: closeFunction == null ? 10 : 0),
            child: Text(text, style: const TextStyle(color: navy)),
          ),
          if (closeFunction == null)
            const SizedBox(width: 15)
          else
            IconButton(
              onPressed: closeFunction,
              icon: const Icon(Icons.close, color: navy),
            )
        ],
      ),
    );
  }
}
