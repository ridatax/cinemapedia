import 'package:dio/dio.dart';
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies.datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/mappers/movie.mapper.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/moviedb.response.dart';


class MoviedbDatasource extends MoviesDatasource {

  final _dio = Dio(BaseOptions(
      baseUrl: Environment.theMovieDbUrl,
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'languague': Environment.languague
      }
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await _dio.get('/movie/now_playing');
    final moviedbResponse = MoviedbResponse.fromJson(response.data);
    final List<Movie> movies = moviedbResponse.results
        .where((moviedb) => moviedb.posterPath != Environment.EMPTY)
        .map(MovieMapper.movieDbToEntity).toList();
    return movies;
  }

}