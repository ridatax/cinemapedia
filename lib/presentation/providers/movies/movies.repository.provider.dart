import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/infrastructure/repositories/movies.repository.impl.dart';
import 'package:cinemapedia/infrastructure/datasources/moviedb.datasource.dart';

final movieRepositoryProvider = Provider((ref) {
  return MoviesRepositoryImpl( MoviedbDatasource());
});