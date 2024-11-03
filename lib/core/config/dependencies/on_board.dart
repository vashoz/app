part of '../config.dart';

Future<void> get onBoardDependencies async {
  //! ----------------- Bloc -----------------

  //! ----------------- UseCase -----------------

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<OnBoardRepository>(
    () => OnBoardRepositoryImpl(
      network: sl(),
      remote: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<OnBoardRemoteDataSource>(
    () => OnBoardRemoteDataSourceImpl(
      client: sl(),
    ),
  );
}
