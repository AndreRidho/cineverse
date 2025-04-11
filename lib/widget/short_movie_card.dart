import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineverse/config/colors/colors.dart';
import 'package:cineverse/core/constants/constants.dart';
import 'package:cineverse/core/routes/app_route.dart';
import 'package:cineverse/core/routes/navigation_service.dart';
import 'package:cineverse/feature_movie/domain/model/movie.dart';
import 'package:cineverse/widget/fade_text.dart';
import 'package:cineverse/widget/shimmer_image.dart';
import 'package:flutter/material.dart';

class ShortMovieCard extends StatelessWidget {
  const ShortMovieCard(
      {super.key, required this.movie, this.onReturnFromMovie});

  final Movie movie;
  final Function()? onReturnFromMovie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await NavigationService.get()
            .navigateTo(AppRoute.movieScreen, arguments: [movie]);

        if (onReturnFromMovie != null) onReturnFromMovie!();
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: movie.backdropPath == null
                      ? AspectRatio(
                          aspectRatio: 500 / 281,
                          child: Container(
                            color: lightNavy,
                            child: const Center(
                              child: Icon(Icons.image, size: 50),
                            ),
                          ),
                        )
                      : CachedNetworkImage(
                          imageUrl: '$kBaseImageUrl${movie.backdropPath}',
                          placeholder: (context, _) =>
                              const ShimmerImage(mini: true),
                        ),
                ),
                const SizedBox(height: 10),
                Text(movie.originalTitle, maxLines: 2)
              ],
            ),
          ),
          const FadeText(),
        ],
      ),
    );
  }
}
