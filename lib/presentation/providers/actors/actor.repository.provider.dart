import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/infrastructure/datasources/actors.movidb.datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actors.moviedb.repository.impl.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorMoviedbRepositoryImpl( ActorsMoviedbDatasource() );
});