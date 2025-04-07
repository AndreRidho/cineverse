import 'package:cineverse/config/colors/colors.dart';
import 'package:flutter/material.dart';

class FadeText extends StatelessWidget {
  const FadeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(0, 0.7),
            end: Alignment.bottomCenter,
            colors: [navy.withOpacity(0), navy],
          ),
        ),
      ),
    );
  }
}
