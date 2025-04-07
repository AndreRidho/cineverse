import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineverse/core/routes/app_route.dart';
import 'package:cineverse/core/routes/navigation_service.dart';
import 'package:cineverse/config/colors/colors.dart';
import 'package:cineverse/core/constants/constants.dart';
import 'package:cineverse/core/di/di.dart';
import 'package:cineverse/util/mixin/dialogs.dart';
import 'package:cineverse/util/mixin/underline_border.dart';
import 'package:cineverse/widget/bottom_bar.dart';
import 'package:cineverse/widget/card_row.dart';
import 'package:cineverse/widget/dropdown.dart';
import 'package:cineverse/widget/fade_text.dart';
import 'package:cineverse/widget/loading.dart';
import 'package:cineverse/widget/search_bar.dart';
import 'package:cineverse/widget/shimmer_image.dart';
import 'package:cineverse/widget/tags.dart';
import 'package:cineverse/feature_movie/domain/model/genre.dart';
import 'package:cineverse/feature_movie/domain/model/language.dart';
import 'package:cineverse/feature_movie/domain/model/movie.dart';
import 'package:cineverse/feature_movie/domain/usecase/discover_movies_use_case.dart';
import 'package:cineverse/feature_movie/domain/usecase/search_movies_use_case.dart';
import 'package:cineverse/feature_movie/presentation/home_screen/cubit/home_screen_cubit.dart';
import 'package:cineverse/feature_movie/presentation/home_screen/cubit/setup_search_cubit.dart';
import 'package:cineverse/main.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget with Dialogs, UnderlineBorder {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final popular = useState<List<Movie>?>(null);
    final upcoming = useState<List<Movie>?>(null);
    final nowPlaying = useState<List<Movie>?>(null);
    final topRated = useState<List<Movie>?>(null);

    final searchResults = useState<List<Movie>?>(null);
    final discoverResults = useState<List<Movie>?>(null);

    final popularPage = useState(1);
    final upcomingPage = useState(1);
    final nowPlayingPage = useState(1);
    final topRatedPage = useState(1);

    final searchPage = useState(1);
    final discoverPage = useState(1);

    final searchController = useTextEditingController();

    final searchListen = useValueListenable(searchController).text;

    final language = useState<Language?>(null);
    final genres = useState<List<Genre>>([]);
    final year = useState<int?>(null);
    final sortBy = useState<SearchCategory>(SearchCategory.originalTitle);
    final sortDirection = useState(true);
    final includeAdult = useState(false);

    var size = MediaQuery.of(context).size;

    useEffect(() {
      if (searchController.text.isEmpty) {
        BlocProvider.of<HomeScreenCubit>(context)
            .discoverMovies(DiscoverMoviesParams(
          page: discoverPage.value,
          language: language.value?.iso6391,
          genres: genres.value.isEmpty
              ? null
              : genres.value.map((e) => e.id).toList(),
          sortBy:
              '${sortBy.value.name}.${sortDirection.value ? 'asc' : 'desc'}',
          primaryReleaseYear: year.value,
        ));
      } else {
        BlocProvider.of<HomeScreenCubit>(context).searchMovies(
          SearchMoviesParams(
            query: searchController.text,
            page: searchPage.value,
            language: language.value?.iso6391,
            includeAdult: includeAdult.value,
            year: year.value,
          ),
        );
      }
      return () {};
    }, [
      searchListen,
      language.value,
      genres.value,
      year.value,
      sortBy.value,
      sortDirection.value,
      includeAdult.value
    ]);

    bool? searchOrDiscover;
    List<Movie>? queryResults;
    ValueNotifier<int>? queryPage;

    if (searchController.text.isNotEmpty) {
      queryResults = searchResults.value;
      queryPage = searchPage;
      searchOrDiscover = true;
    } else if (language.value != null ||
        genres.value.isNotEmpty ||
        year.value != null ||
        includeAdult.value) {
      queryResults = discoverResults.value;
      queryPage = discoverPage;
      searchOrDiscover = false;
    } else {
      queryResults = null;
      queryPage = null;
      searchOrDiscover = null;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('CineVerse'),
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<HomeScreenCubit, HomeScreenState>(
        listener: (BuildContext context, HomeScreenState state) {
          if (state is HomeScreenInitial) {
            updateList(state.popular, popular);
            updateList(state.nowPlaying, nowPlaying);
            updateList(state.upcoming, upcoming);
            updateList(state.topRated, topRated);

            if (state.pageChanged == false) {
              searchResults.value = state.searchResults;
              discoverResults.value = state.discoverResults;
            } else {
              updateList(state.searchResults, searchResults);
              updateList(state.discoverResults, discoverResults);
            }
          }

          if (state is HomeScreenError) {
            errorDialog(context, state.message);
          }
        },
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () {
              popular.value = null;
              nowPlaying.value = null;
              upcoming.value = null;
              topRated.value = null;

              searchController.text = '';
              language.value = null;
              genres.value = [];
              year.value = null;
              sortBy.value = SearchCategory.originalTitle;
              sortDirection.value = true;
              includeAdult.value = false;

              return BlocProvider.of<HomeScreenCubit>(context).getMovies();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 25),
                    child: MySearchBar(
                      searchController: searchController,
                      suffixIcon: Icons.sort_rounded,
                      showPrefix: searchController.text.isNotEmpty,
                      prefixFunc: () => searchController.text = '',
                      suffixFunc: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return searchDialog(
                              searchController,
                              language,
                              genres,
                              year,
                              sortBy,
                              sortDirection,
                              includeAdult,
                            );
                          },
                        );
                      },
                    ),
                  ),
                  if (queryResults != null) ...[
                    if ((language.value != null ||
                        genres.value.isNotEmpty ||
                        year.value != null ||
                        includeAdult.value))
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TagRow(tags: [
                          if (language.value != null)
                            Tag(
                              text: language.value!.englishName,
                              closeFunction: () => language.value = null,
                            ),
                          ...genres.value.map(
                            (genre) => Tag(
                                text: genre.name,
                                closeFunction: () {
                                  final tempList = [...genres.value];
                                  tempList.remove(genre);
                                  genres.value = tempList;
                                }),
                          ),
                          if (year.value != null)
                            Tag(
                              text: year.value!.toString(),
                              closeFunction: () => year.value = null,
                            ),
                          if (includeAdult.value)
                            Tag(
                              text: "Include adult-rated",
                              closeFunction: () => includeAdult.value = false,
                            ),
                        ]),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomMaterialIndicator(
                        trigger: IndicatorTrigger.trailingEdge,
                        // indicatorBuilder: (context, controller) => Padding(
                        //   padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        //   child: const Loading(),
                        // ),
                        onRefresh: () {
                          queryPage!.value = queryPage.value + 1;

                          if (searchOrDiscover!) {
                            return BlocProvider.of<HomeScreenCubit>(context)
                                .searchMovies(
                                    SearchMoviesParams(
                                        query: searchController.text,
                                        page: queryPage.value,
                                        includeAdult: includeAdult.value,
                                        language: language.value?.iso6391,
                                        year: year.value),
                                    true);
                          } else {
                            return BlocProvider.of<HomeScreenCubit>(context)
                                .discoverMovies(
                                    DiscoverMoviesParams(
                                      page: queryPage.value,
                                      includeAdult: includeAdult.value,
                                      language: language.value?.iso6391,
                                      genres: genres.value
                                          .map((e) => e.id)
                                          .toList(),
                                      primaryReleaseYear: year.value,
                                      sortBy: sortBy.value.snakeName,
                                      year: year.value,
                                    ),
                                    true);
                          }
                        },
                        child: SizedBox(
                          height: size.height,
                          child: Column(
                            children: [
                              Expanded(
                                child: GridView.count(
                                  shrinkWrap: true,
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.15,
                                  children: [
                                    ...queryResults.map(
                                        (movie) => shortMovieCard(movie, size)),
                                    for (int i = 0; i < 6; i++)
                                      // shimmerMovie(size, mini: true)
                                      const SizedBox()
                                  ],
                                ),
                              ),
                              SizedBox(height: size.height - 650)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ] else ...[
                    movieRow(
                      context,
                      size,
                      'Popular',
                      popular.value,
                      popularPage,
                      (page) {
                        return BlocProvider.of<HomeScreenCubit>(context)
                            .getMovies(
                          getNowPlaying: false,
                          getTopRated: false,
                          getUpcoming: false,
                          popularPage: page,
                        );
                      },
                    ),
                    movieRow(
                      context,
                      size,
                      'Upcoming',
                      upcoming.value,
                      upcomingPage,
                      (page) {
                        return BlocProvider.of<HomeScreenCubit>(context)
                            .getMovies(
                          getNowPlaying: false,
                          getTopRated: false,
                          getPopular: false,
                          upcomingPage: page,
                        );
                      },
                    ),
                    movieRow(
                      context,
                      size,
                      'Now Playing',
                      nowPlaying.value,
                      nowPlayingPage,
                      (page) {
                        return BlocProvider.of<HomeScreenCubit>(context)
                            .getMovies(
                          getPopular: false,
                          getTopRated: false,
                          getUpcoming: false,
                          nowPlayingPage: page,
                        );
                      },
                    ),
                    movieRow(
                      context,
                      size,
                      'Top Rated',
                      topRated.value,
                      topRatedPage,
                      (page) {
                        return BlocProvider.of<HomeScreenCubit>(context)
                            .getMovies(
                          getNowPlaying: false,
                          getPopular: false,
                          getUpcoming: false,
                          topRatedPage: page,
                        );
                      },
                    ),
                  ]
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomBar(index: 0),
    );
  }

  Widget shortMovieCard(Movie movie, size) {
    return GestureDetector(
      onTap: () => NavigationService.get()
          .navigateTo(AppRoute.movieScreen, arguments: [movie]),
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

  CardRow movieRow(context, size, String title, List<Movie>? movies,
      ValueNotifier<int> pageHook, Future Function(int page) getMovies) {
    return CardRow<Movie>(
      title: title,
      items: movies,
      onRefresh: () {
        pageHook.value = pageHook.value + 1;

        return getMovies(pageHook.value);
      },
      onTap: (movie) => NavigationService.get()
          .navigateTo(AppRoute.movieScreen, arguments: [movie]),
      getLink: (item) => '$kBaseImageUrl${item.posterPath}',
      getName: (item) => item.originalTitle,
    );
  }

  updateList(List<Movie>? stateMovies, ValueNotifier<List<Movie>?> movies) {
    if (stateMovies != null) {
      if (movies.value == null) {
        movies.value = stateMovies;
      } else {
        final tempList = [...movies.value!];
        tempList.addAll(stateMovies);
        movies.value = tempList;
      }
    }
  }

  Widget searchDialog(
    TextEditingController sc,
    ValueNotifier<Language?> l,
    ValueNotifier<List<Genre>> g,
    ValueNotifier<int?> y,
    ValueNotifier<SearchCategory?> sb,
    ValueNotifier<bool> sd,
    ValueNotifier<bool> ia,
  ) {
    return BlocProvider(
      create: (context) => sl<SetupSearchCubit>()..getGenresAndLanguages(),
      child: BlocConsumer<SetupSearchCubit, SetupSearchState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (message) {
              pop();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return Dialog(
            child: HookBuilder(builder: (context) {
              final searchController = useTextEditingController(text: sc.text);
              final language = useState<Language?>(l.value);
              final genres = useState<List<Genre>>(g.value);
              final yearController = useTextEditingController(
                  text: y.value == null ? "" : y.value.toString());
              final sortBy = useState<SearchCategory?>(sb.value);
              final sortDirection = useState(sd.value);
              final includeAdult = useState(ia.value);

              return Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MySearchBar(
                        searchController: searchController,
                        lineBorder: true,
                        showPrefix: searchController.text.isNotEmpty,
                        prefixFunc: () => searchController.text = '',
                      ),
                      ...state.maybeWhen<List<Widget>>(
                        loaded: (stateGenres, languages) {
                          final tempStateGenres = [...stateGenres];

                          tempStateGenres.removeWhere((stateGenre) =>
                              genres.value.any((e) => stateGenre.id == e.id));

                          return searchDialogContents(
                              language: language,
                              languages: languages,
                              tempStateGenres: tempStateGenres,
                              genres: genres,
                              yearController: yearController,
                              sortBy: sortBy,
                              sortDirection: sortDirection,
                              includeAdult: includeAdult,
                              searchController: searchController,
                              pop: pop,
                              sc: sc,
                              l: l,
                              g: g,
                              y: y,
                              sb: sb,
                              ia: ia);
                        },
                        orElse: () => [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Loading(),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }

  List<Widget> searchDialogContents({
    required ValueNotifier<Language?> language,
    required List<Language> languages,
    required List<Genre?> tempStateGenres,
    required ValueNotifier<List<Genre>> genres,
    required TextEditingController yearController,
    required ValueNotifier<SearchCategory?> sortBy,
    required ValueNotifier<bool> sortDirection,
    required ValueNotifier<bool> includeAdult,
    required TextEditingController searchController,
    required VoidCallback pop,
    required TextEditingController sc,
    required ValueNotifier<Language?> l,
    required ValueNotifier<List<Genre>> g,
    required ValueNotifier<int?> y,
    required ValueNotifier<SearchCategory?> sb,
    required ValueNotifier<bool> ia,
  }) {
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Language"),
              MyDropdown(
                value: language.value,
                hint: "Select a language",
                items: languages,
                getLabel: (lang) => lang.englishName,
                onChanged: (newValue) => language.value = newValue,
              ),
            ],
          ),
          if (tempStateGenres.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Genre"),
                MyDropdown(
                  value: null,
                  hint: "Add a genre",
                  items: tempStateGenres,
                  getLabel: (genre) => genre?.name ?? "Add a genre",
                  onChanged: (newValue) {
                    if (newValue != null) {
                      final tempList = [...genres.value];
                      tempList.add(newValue);
                      genres.value = tempList;
                    }
                  },
                ),
              ],
            ),
          if (genres.value.isNotEmpty)
            TagRow(
                tags: genres.value
                    .map(
                      (genre) => Tag(
                          text: genre.name,
                          closeFunction: () {
                            final tempList = [...genres.value];
                            tempList.remove(genre);
                            genres.value = tempList;
                          }),
                    )
                    .toList()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(flex: 3, child: Text("Year")),
              Expanded(
                flex: 2,
                child: TextFormField(
                  controller: yearController,
                  decoration: InputDecoration(
                    border: underlineBorder(faded: true),
                    enabledBorder: underlineBorder(faded: true),
                    focusedBorder: underlineBorder(),
                    hintText: "Enter year...",
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    final yearValue = int.tryParse(value);
                    if (yearValue != null) {
                      final currentYear = DateTime.now().year;
                      if (yearValue > currentYear) {
                        yearController.text = currentYear.toString();
                      }
                    }
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Expanded(child: Text("Sort by")),
              MyDropdown(
                value: sortBy.value,
                hint: "Sort...",
                items: SearchCategory.values,
                getLabel: (c) => c.displayName,
                onChanged: (value) => sortBy.value = value,
              ),
              if (sortBy.value != null)
                IconButton(
                  onPressed: () {
                    sortDirection.value = !sortDirection.value;
                  },
                  icon: Icon(
                    sortDirection.value
                        ? Icons.arrow_upward_rounded
                        : Icons.arrow_downward_rounded,
                  ),
                )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Include adult-rated movies"),
              Checkbox(
                value: includeAdult.value,
                onChanged: (newValue) {
                  if (newValue != null) {
                    includeAdult.value = newValue;
                  }
                },
              ),
            ],
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: pop,
            child: const Text(
              'Back',
              style: TextStyle(color: blueGray),
            ),
          ),
          TextButton(
            onPressed: () {
              sc.text = searchController.text;
              l.value = language.value;
              g.value = genres.value;
              y.value = int.parse(yearController.text);
              sb.value = sortBy.value;
              ia.value = includeAdult.value;
              pop();
            },
            child: const Text(
              'Apply',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      )
    ];
  }
}

enum SearchCategory {
  popularity,
  releaseDate,
  revenue,
  originalTitle,
  voteAverage,
  voteCount,
}

extension SearchCategoryExtension on SearchCategory {
  String get displayName {
    switch (this) {
      case SearchCategory.popularity:
        return "Popularity";
      case SearchCategory.releaseDate:
        return "Release Date";
      case SearchCategory.revenue:
        return "Revenue";
      case SearchCategory.originalTitle:
        return "Original Title";
      case SearchCategory.voteAverage:
        return "Vote Average";
      case SearchCategory.voteCount:
        return "Vote Count";
    }
  }

  String get snakeName {
    switch (this) {
      case SearchCategory.popularity:
        return "popularity";
      case SearchCategory.releaseDate:
        return "release_date";
      case SearchCategory.revenue:
        return "revenue";
      case SearchCategory.originalTitle:
        return "original_title";
      case SearchCategory.voteAverage:
        return "vote_average";
      case SearchCategory.voteCount:
        return "vote_count";
    }
  }
}
