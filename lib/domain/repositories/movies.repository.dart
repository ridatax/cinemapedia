import '../entities/entities.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({ int page = 1});
}