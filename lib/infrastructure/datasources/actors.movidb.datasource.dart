import 'package:dio/dio.dart';
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/infrastructure/models/models.dart';
import 'package:cinemapedia/infrastructure/mappers/mapper.dart';
import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:cinemapedia/domain/datasources/actors.datasource.dart';

class ActorsMoviedbDatasource extends ActorsDatasource {
  final _dio = Dio(BaseOptions(
      baseUrl: Environment.MOVIEDB_URL,
      queryParameters: {'api_key': Environment.MOVIEDB_KEY, 'language': Environment.LANGUAGUE}));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await _dio.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast.map((cast) => ActorMapper.castToEntity(cast)).toList();

    return actors;
  }
}
