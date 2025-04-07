import 'package:cineverse/config/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerImage extends StatelessWidget {
  const ShimmerImage({super.key, this.mini = false});

  final bool mini;

  @override
  Widget build(BuildContext context) {
    final deco = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    );

    final size = MediaQuery.of(context).size;

    return Shimmer.fromColors(
      baseColor: lightNavy,
      highlightColor: blueGray,
      child: mini
          ? AspectRatio(
              aspectRatio: 500 / 281,
              child: Container(decoration: deco),
            )
          : Container(
              height: size.width / 2,
              width: size.width / 3,
              decoration: deco,
            ),
    );
  }
}
