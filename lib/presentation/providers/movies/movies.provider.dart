import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:cinemapedia/presentation/providers/movies/movies.repository.provider.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(fetchNextMovies: fetchMoreMovies);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int _currentPage = 0;
  MovieCallback fetchNextMovies;

  MoviesNotifier({required this.fetchNextMovies}) : super([]);

  Future<void> loadNextPage() async {
    _currentPage++;
    final List<Movie> movies = await fetchNextMovies(page: _currentPage);
    state = [...state, ...movies];
  }
}
