part of '../config.dart';

Future<void> get productDetailsDependencies async {
  //! ----------------- Bloc -----------------

  //! ----------------- UseCase -----------------

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<ProductDetailsRepository>(
    () => ProductDetailsRepositoryImpl(
      network: sl(),
      remote: sl(),
      local: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<ProductDetailsRemoteDataSource>(
    () => ProductDetailsRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<ProductDetailsLocalDataSource>(
    () => ProductDetailsLocalDataSourceImpl(),
  );
}
