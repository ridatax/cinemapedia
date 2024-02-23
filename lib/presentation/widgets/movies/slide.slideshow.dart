import 'package:flutter/material.dart';
import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:go_router/go_router.dart';

class Slide<T extends Movie> extends StatelessWidget {
  final T movie;

  const Slide({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).secondaryHeaderColor;
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: colors, blurRadius: 10, offset: const Offset(0, 10))]);

    return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: DecoratedBox(
            decoration: decoration,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GestureDetector(
                  onTap: () => context.push('/movie/${ movie.id }'),
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
                    image: NetworkImage(movie.backdropPath),
                  ),
                ))));
  }
}
