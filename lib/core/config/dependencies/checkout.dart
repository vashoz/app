part of '../config.dart';

Future<void> get checkoutDependencies async {
  //! ----------------- Bloc -----------------

  //! ----------------- UseCase -----------------

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<CheckoutRepository>(
    () => CheckoutRepositoryImpl(
      network: sl(),
      remote: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<CheckoutRemoteDataSource>(
    () => CheckoutRemoteDataSourceImpl(
      client: sl(),
    ),
  );
}
