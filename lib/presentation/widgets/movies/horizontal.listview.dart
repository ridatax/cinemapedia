import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:cinemapedia/domain/entities/entities.dart';

class HorizontalListView extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const HorizontalListView(
      {super.key,
      required this.movies,
      this.title,
      this.subTitle,
      this.loadNextPage});

  @override
  State<HorizontalListView> createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;

      if ((scrollController.position.pixels + 200) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (widget.title != null || widget.subTitle != null)
            BannerTitle(title: widget.title, subtitle: widget.subTitle),
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                itemCount: widget.movies.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return FadeInRight(
                      child: SlideHorizontal(movie: widget.movies[index]));
                }),
          )
        ],
      ),
    );
  }
}




