part of '../config.dart';

Future<void> get shippingMethodDependencies async {
  //! ----------------- Bloc -----------------

  //! ----------------- UseCase -----------------

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<ShippingMethodRepository>(
    () => ShippingMethodRepositoryImpl(
      network: sl(),
      remote: sl(),
      local: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<ShippingMethodRemoteDataSource>(
    () => ShippingMethodRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<ShippingMethodLocalDataSource>(
    () => ShippingMethodLocalDataSourceImpl(),
  );
}
