import 'package:cinemapedia/config/constants/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:cinemapedia/presentation/delegate/search.movie.delegate.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
        bottom: false,
        child: Container(

          color: colors.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Icon(Icons.movie_outlined, color: colors.secondary),
                  const SizedBox(width: 5),
                  Text(Environment.APP_NAME, style: titleStyle),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        final searchedMovies = ref.read(searchedMoviesProvider);
                        final searchQuery = ref.read(searchQueryProvider);

                        showSearch<Movie?>(
                                query: searchQuery,
                                context: context,
                                delegate: SearchMovieDelegate(
                                    initialMovies: searchedMovies,
                                    searchMovies: ref
                                        .read(searchedMoviesProvider.notifier)
                                        .searchMoviesByQuery))
                            .then((movie) {
                          if (movie == null) return;

                          context.push('/movie/${movie.id}');
                        });
                      },
                      icon: const Icon(Icons.search))
                ],
              ),
            ),
          ),
        ));
  }
}
