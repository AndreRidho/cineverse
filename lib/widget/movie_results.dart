import 'package:cineverse/feature_movie/domain/model/movie.dart';
import 'package:cineverse/widget/short_movie_card.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';

class MovieResults extends StatelessWidget {
  const MovieResults(
      {super.key,
      required this.onRefresh,
      this.onReturnFromMovie,
      required this.movies});

  final List<Movie> movies;
  final Future Function() onRefresh;
  final Function()? onReturnFromMovie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomMaterialIndicator(
        trigger: IndicatorTrigger.trailingEdge,
        onRefresh: onRefresh,
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 1.15,
          children: [
            ...movies.map((movie) => ShortMovieCard(
                movie: movie, onReturnFromMovie: onReturnFromMovie)),
            // for (int i = 0; i < 6; i++) const SizedBox()
          ],
        ),
      ),
    );
  }
}
