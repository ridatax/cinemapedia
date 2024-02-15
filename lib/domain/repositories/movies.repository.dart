import '../entities/entities.dart';

abstract class MovieDatasource {
  Future<List<Movie>> getNowPlaying({ int page = 1});
}