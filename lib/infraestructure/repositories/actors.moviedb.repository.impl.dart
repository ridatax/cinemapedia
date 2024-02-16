import 'package:cinemapedia/domain/datasources/actors.datasource.dart';
import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:cinemapedia/domain/repositories/actors.repository.dart';

class ActorMoviedbRepositoryImpl extends ActorsRepository {
  final ActorsDatasource datasource;

  ActorMoviedbRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}
