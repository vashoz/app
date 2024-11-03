part of '../config.dart';

Future<void> get deliveryAddressDependencies async {
  //! ----------------- Bloc -----------------

  //! ----------------- UseCase -----------------

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<DeliveryAddressRepository>(
    () => DeliveryAddressRepositoryImpl(
      network: sl(),
      remote: sl(),
      local: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<DeliveryAddressRemoteDataSource>(
    () => DeliveryAddressRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<DeliveryAddressLocalDataSource>(
    () => DeliveryAddressLocalDataSourceImpl(),
  );
}
