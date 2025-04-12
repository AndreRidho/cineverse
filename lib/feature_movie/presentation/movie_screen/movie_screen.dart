import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineverse/config/colors/colors.dart';
import 'package:cineverse/core/constants/constants.dart';
import 'package:cineverse/core/di/di.dart';
import 'package:cineverse/core/routes/app_route.dart';
import 'package:cineverse/core/routes/navigation_service.dart';
import 'package:cineverse/feature_movie/presentation/movie_screen/cubit/watchlist_button_cubit.dart';
import 'package:cineverse/l10n/gen_l10n/app_localizations.dart';
import 'package:cineverse/util/mixin/dialogs.dart';
import 'package:cineverse/widget/card_row.dart';
import 'package:cineverse/widget/element_padding.dart';
import 'package:cineverse/widget/loading.dart';
import 'package:cineverse/widget/tags.dart';
import 'package:cineverse/widget/title.dart';
import 'package:cineverse/feature_movie/domain/model/actor.dart';
import 'package:cineverse/feature_movie/domain/model/movie.dart';
import 'package:cineverse/feature_movie/presentation/movie_screen/cubit/movie_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class MovieScreen extends StatelessWidget with Dialogs {
  const MovieScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Stack(
        children: [
          BlocBuilder<MovieScreenCubit, MovieScreenState>(
            builder: (context, state) {
              final genreNames = state.maybeWhen(
                  loaded: (actors, stateMovie, genres) {
                    if (genres == null) return null;
                    return movie.genreIds
                        .map(
                          (id) => genres.firstWhere((g) => g.id == id).name,
                        )
                        .toList();
                  },
                  orElse: () => null);

              String reviews;

              if (movie.voteCount >= 1000000000) {
                reviews =
                    '${(movie.voteCount / 1000000000).toStringAsFixed(3)}B';
              } else if (movie.voteCount >= 1000000) {
                reviews = '${(movie.voteCount / 1000000).toStringAsFixed(3)}M';
              } else if (movie.voteCount >= 1000) {
                reviews = '${(movie.voteCount / 1000).toStringAsFixed(3)}k';
              } else {
                reviews = movie.voteCount.toString();
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      height: size.height / 2,
                      width: size.width,
                      fit: BoxFit.cover,
                      imageUrl: '$kBaseImageUrl${movie.posterPath}',
                      placeholder: (context, _) => Shimmer.fromColors(
                        baseColor: lightNavy,
                        highlightColor: blueGray,
                        child: SizedBox(
                          height: size.height / 2,
                          width: size.width,
                        ),
                      ),
                    ),
                    ElementPadding(
                        widget: Row(
                      children: [
                        Expanded(child: MyTitle(title: movie.title)),
                        state.maybeWhen(
                          loaded: (actors, movie, genres) {
                            if (movie == null || !movie.adult) {
                              return const SizedBox();
                            }
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.red,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  '18+',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          },
                          orElse: () => const SizedBox(),
                        ),
                      ],
                    )),
                    ElementPadding(
                        widget: Text(
                            '${DateTime.parse(movie.releaseDate).year}${state.maybeWhen(
                      loaded: (actors, movie, genres) =>
                          movie?.runtime == null ? '' : ' · ${movie!.runtime}',
                      orElse: () => '',
                    )}')),
                    if (genreNames != null)
                      ElementPadding(
                          widget: TagRow(
                        tags: genreNames.map((e) => Tag(text: e)).toList(),
                        paddingY: 0,
                      )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SizedBox(
                        height: 80,
                        child: Row(
                          children: [
                            Text(
                              movie.voteAverage.toStringAsFixed(1),
                              style: const TextStyle(
                                  fontSize: 70, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: RatingStars(
                                      value: movie.voteAverage / 2,
                                      starColor: blue,
                                      valueLabelVisibility: false,
                                    ),
                                  ),
                                ),
                                Text(
                                    '$reviews ${AppLocalizations.of(context)!.reviews}'),
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                    ElementPadding(widget: Text(movie.overview)),
                    const SizedBox(height: 20),
                    CardRow<Actor>(
                      title: AppLocalizations.of(context)!.castCrew,
                      items: state.maybeWhen(
                          loaded: (actors, movie, genres) {
                            return actors;
                          },
                          orElse: () => null),
                      onRefresh: () async {},
                      refreshable: false,
                      onTap: (actor) {},
                      getLink: (actor) => '$kBaseImageUrl${actor.profilePath}',
                      getName: (actor) => actor.name,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              );
            },
          ),
          BlocProvider(
            create: (context) =>
                sl<WatchlistButtonCubit>()..watchlistOrNot(movie.id),
            child: BlocConsumer<WatchlistButtonCubit, WatchlistButtonState>(
              listener: (context, state) {
                state.maybeWhen(
                  error: (errorMessage) => snackMessage(context, errorMessage),
                  unauth: () async {
                    final prefs = sl<SharedPreferences>();

                    await prefs.remove(kSessionId);
                    await prefs.remove(kAccountId);

                    NavigationService.get()
                        .navigateTo(AppRoute.loginScreen, popAll: true);
                  },
                  orElse: () {},
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  error: (errorMessage) => const SizedBox(),
                  orElse: () => Positioned(
                    bottom: 30,
                    right: 30,
                    left: 30,
                    child: InkWell(
                      onTap: () {
                        state.maybeWhen(
                            orElse: () {},
                            loaded: (inWatchlist) {
                              BlocProvider.of<WatchlistButtonCubit>(context)
                                  .editList(!inWatchlist, movie.id);
                            });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: lightNavy,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: state.maybeWhen(
                              orElse: () => [const Loading()],
                              loaded: (inWatchlist) => [
                                Icon(inWatchlist
                                    ? Icons.bookmark_rounded
                                    : Icons.bookmark_outline_rounded),
                                const SizedBox(width: 7),
                                Text(inWatchlist
                                    ? AppLocalizations.of(context)!
                                        .removeFromWatchList
                                    : AppLocalizations.of(context)!
                                        .addToWatchList)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
