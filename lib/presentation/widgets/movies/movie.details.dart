import 'package:flutter/material.dart';
import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  const MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //* Titulo, OverView y Rating
        TitleAndOverview(movie: movie, size: size, textStyles: textStyles),

        //* Generos de la película
        Genres(movie: movie),

        ActorsByMovie(movieId: movie.id.toString()),

        //* Videos de la película (si tiene)
        VideosFromMovie(movieId: movie.id),

        //* Películas similares
        SimilarMovies(movieId: movie.id),

        const SizedBox(height: 50),
      ],
    );
  }
}
