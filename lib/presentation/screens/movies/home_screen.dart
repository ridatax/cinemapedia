import 'package:cinemapedia/presentation/providers/movies/movies.provider.dart';
import 'package:flutter/material.dart';
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _HomeView());
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView({
    super.key,
  });

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final _nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    return ListView.builder(
        itemCount: _nowPlayingMovies.length,
        itemBuilder: (context, index) {
          final movie = _nowPlayingMovies[index];
          return ListTile(title: Text(movie.title));
        });
  }
}
