part of '../config.dart';

Future<void> get ordersDependencies async {
  //! ----------------- Bloc -----------------

  sl.registerFactory(
    () => FindAllBloc(
      usecase: sl(),
    ),
  );

  //! ----------------- UseCase -----------------

  sl.registerLazySingleton<FindAllOrdersUseCase>(
    () => FindAllOrdersUseCase(
      repository: sl(),
    ),
  );

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<OrdersRepository>(
    () => OrdersRepositoryImpl(
      network: sl(),
      remote: sl(),
      local: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<OrdersRemoteDataSource>(
    () => OrdersRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<OrdersLocalDataSource>(
    () => OrdersLocalDataSourceImpl(),
  );
}
