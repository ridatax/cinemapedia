import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchNextMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(fetchNextMovies: fetchNextMovies);
});

final popularMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchNextMovies = ref.watch(movieRepositoryProvider).getPopular;
  return MoviesNotifier(fetchNextMovies: fetchNextMovies);
});

final topRatedMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchNextMovies = ref.watch(movieRepositoryProvider).getTopRated;
  return MoviesNotifier(fetchNextMovies: fetchNextMovies);
});

final upComingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchNextMovies = ref.watch(movieRepositoryProvider).getUpComing;
  return MoviesNotifier(fetchNextMovies: fetchNextMovies);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MovieCallback fetchNextMovies;

  MoviesNotifier({required this.fetchNextMovies}) : super([]);

  Future<void> loadNextPage() async {
    if ( isLoading ) return;
    isLoading = true;
    currentPage++;
    final List<Movie> movies = await fetchNextMovies(page: currentPage);
    state = [...state, ...movies];

    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
