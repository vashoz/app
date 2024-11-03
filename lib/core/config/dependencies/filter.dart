part of '../config.dart';

Future<void> get filterDependencies async {
  //! ----------------- Bloc -----------------

  //! ----------------- UseCase -----------------

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<FilterRepository>(
    () => FilterRepositoryImpl(
      network: sl(),
      remote: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<FilterRemoteDataSource>(
    () => FilterRemoteDataSourceImpl(
      client: sl(),
    ),
  );
}
