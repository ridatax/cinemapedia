import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/entities.dart';

class Slide<T extends Movie> extends StatelessWidget {
  final T movie;
  const Slide({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).secondaryHeaderColor;
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow:  [
          BoxShadow(
              color: colors, blurRadius: 10, offset: const Offset(0, 10))
        ]);

    return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: DecoratedBox(
            decoration: decoration,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.backdropPath,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return const DecoratedBox(
                          decoration: BoxDecoration(color: Colors.black12));
                    }
                    return FadeIn(child: child);
                  },
                ))));
  }
}
