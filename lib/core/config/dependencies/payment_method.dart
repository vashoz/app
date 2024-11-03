part of '../config.dart';

Future<void> get paymentMethodDependencies async {
  //! ----------------- Bloc -----------------

  //! ----------------- UseCase -----------------

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<PaymentMethodRepository>(
    () => PaymentMethodRepositoryImpl(
      network: sl(),
      remote: sl(),
      local: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<PaymentMethodRemoteDataSource>(
    () => PaymentMethodRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<PaymentMethodLocalDataSource>(
    () => PaymentMethodLocalDataSourceImpl(),
  );
}
