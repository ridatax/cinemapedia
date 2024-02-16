import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/infraestructure/datasources/actors.movidb.datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/actors.moviedb.repository.impl.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorMoviedbRepositoryImpl( ActorsMoviedbDatasource() );
});