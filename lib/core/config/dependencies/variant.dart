part of '../config.dart';

Future<void> get variantDependencies async {
  //! ----------------- Bloc -----------------

  //! ----------------- UseCase -----------------

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<VariantRepository>(
    () => VariantRepositoryImpl(
      network: sl(),
      remote: sl(),
      local: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<VariantRemoteDataSource>(
    () => VariantRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<VariantLocalDataSource>(
    () => VariantLocalDataSourceImpl(),
  );
}
