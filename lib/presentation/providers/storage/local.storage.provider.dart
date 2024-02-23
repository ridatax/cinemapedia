import 'package:cinemapedia/infrastructure/datasources/isar.local.datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/local.storage.repository.impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDatasource());
});
