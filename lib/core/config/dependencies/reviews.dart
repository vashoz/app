part of '../config.dart';

Future<void> get reviewsDependencies async {
  //! ----------------- Bloc -----------------

  //! ----------------- UseCase -----------------

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<ReviewsRepository>(
    () => ReviewsRepositoryImpl(
      network: sl(),
      remote: sl(),
      local: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<ReviewsRemoteDataSource>(
    () => ReviewsRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<ReviewsLocalDataSource>(
    () => ReviewsLocalDataSourceImpl(),
  );
}
