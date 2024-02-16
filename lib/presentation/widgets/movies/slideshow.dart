import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/presentation/widgets/movies/slide.slideshow.dart';
import 'package:cinemapedia/domain/entities/entities.dart';

class SlideShow<T extends Movie> extends StatelessWidget {
  final List<T> list;

  const SlideShow({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
          viewportFraction: 0.8,
          scale: 0.7,
          autoplay: true,
          pagination: SwiperPagination(
            margin: const EdgeInsets.only(top: 0),
            builder: DotSwiperPaginationBuilder(
              activeColor: colors.primary,
              color: colors.secondary
            )
          ),
          itemCount: list.length,
          itemBuilder: (context, index) => Slide(movie: list[index])),
    );
  }
}


