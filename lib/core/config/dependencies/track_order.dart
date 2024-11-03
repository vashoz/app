part of '../config.dart';

Future<void> get trackOrderDependencies async {
  //! ----------------- Bloc -----------------

  sl.registerFactory(
    () => TrackOrderBloc(
      usecase: sl(),
    ),
  );

  //! ----------------- UseCase -----------------

  sl.registerLazySingleton<ReadTrackOrderUseCase>(
    () => ReadTrackOrderUseCase(
      repository: sl(),
    ),
  );

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<TrackOrderRepository>(
    () => TrackOrderRepositoryImpl(
      network: sl(),
      remote: sl(),
      local: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<TrackOrderRemoteDataSource>(
    () => TrackOrderRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<TrackOrderLocalDataSource>(
    () => TrackOrderLocalDataSourceImpl(),
  );
}
