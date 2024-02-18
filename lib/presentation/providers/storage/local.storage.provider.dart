import 'package:cinemapedia/infraestructure/datasources/isar.local.datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/local.storage.repository.impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDatasource());
});
