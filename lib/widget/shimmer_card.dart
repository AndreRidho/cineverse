import 'package:cineverse/config/colors/colors.dart';
import 'package:cineverse/widget/shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key, this.mini = false});

  final bool mini;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerImage(mini: mini),
          const SizedBox(height: 10),
          Shimmer.fromColors(
            baseColor: lightNavy,
            highlightColor: blueGray,
            child: Container(
              height: 15,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
