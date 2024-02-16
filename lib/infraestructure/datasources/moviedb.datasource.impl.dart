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
    final response = await _dio.get('/movie/now_playing',
    queryParameters: {
      'page': page
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await _dio.get('/movie/popular',
        queryParameters: {
          'page': page
        });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await _dio.get('/movie/top_rated',
        queryParameters: {
          'page': page
        });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpComing({int page = 1}) async {
    final response = await _dio.get('/movie/upcoming',
        queryParameters: {
          'page': page
        });
    return _jsonToMovies(response.data);
  }

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final moviedbResponse = MoviedbResponse.fromJson(json);
    final List<Movie> movies = moviedbResponse.results
        .where((moviedb) => moviedb.posterPath != Environment.EMPTY)
        .map(MovieMapper.movieDbToEntity).toList();
    return movies;
  }



}