import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/moviedb.model.dart';


class MovieMapper {

  static Movie movieDbToEntity(MovieDBModel moviedb) =>
      Movie(
          adult: moviedb.adult,
          backdropPath: (moviedb.backdropPath != '')
              ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
              : 'https://storage.googleapis.com/macrovector-acl-eu/previews/40042/preview_40042.jpg',
          genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
          id: moviedb.id,
          originalLanguage: moviedb.originalLanguage,
          originalTitle: moviedb.originalTitle,
          overview: moviedb.overview,
          popularity: moviedb.popularity,
          posterPath: (moviedb.posterPath != '')
          ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
          : Environment.EMPTY,
          releaseDate: moviedb.releaseDate,
          title: moviedb.title,
          video: moviedb.video,
          voteAverage: moviedb.voteAverage,
          voteCount: moviedb.voteCount);
}