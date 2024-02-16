import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/infraestructure/repositories/movies.repository.impl.dart';
import 'package:cinemapedia/infraestructure/datasources/moviedb.datasource.impl.dart';

final movieRepositoryProvider = Provider((ref) {
  return MoviesRepositoryImpl( MoviedbDatasource());
});