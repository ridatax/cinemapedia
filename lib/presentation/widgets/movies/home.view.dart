import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final initialLoading = ref.watch(initialLoadingProvider);
    if ( initialLoading ) return const FullLoader();

    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upComingMovies = ref.watch(upComingMoviesProvider);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
            floating: true,
            backgroundColor: colors.primary,
            flexibleSpace:  const FlexibleSpaceBar(
              title: CustomAppBar(),
              titlePadding: EdgeInsets.symmetric(vertical: 10),
              centerTitle: false,
            ),
          ),
        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              SlideShow(list: slideShowMovies),
              HorizontalListView(
                movies: nowPlayingMovies,
                title: "En cines",
                subtitle: "Lunes 20",
                loadNextPage: () =>
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
              ),
              HorizontalListView(
                movies: upComingMovies,
                title: "Próximamente",
                subtitle: "Esta mes",
                loadNextPage: () =>
                    ref.read(upComingMoviesProvider.notifier).loadNextPage(),
              ),
              HorizontalListView(
                movies: popularMovies,
                title: "Populares",
                //subtitle: "",
                loadNextPage: () =>
                    ref.read(popularMoviesProvider.notifier).loadNextPage(),
              ),
              HorizontalListView(
                movies: topRatedMovies,
                title: "Mejor calificadas",
                subtitle: "Desde siempre",
                loadNextPage: () =>
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
              ),
              const SizedBox(height: 10)
            ],
          );
        }, childCount: 1))
      ],
    );
  }
}