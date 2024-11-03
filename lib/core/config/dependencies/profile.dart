part of '../config.dart';

Future<void> get profileDependencies async {
  //! ----------------- Bloc -----------------

  //! ----------------- UseCase -----------------

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      network: sl(),
      remote: sl(),
      local: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<ProfileLocalDataSource>(
    () => ProfileLocalDataSourceImpl(),
  );
}
