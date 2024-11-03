part of '../config.dart';

Future<void> get favoriteDependencies async {
  //! ----------------- Bloc -----------------
  sl.registerLazySingleton(() => FavoriteBloc());
  //! ----------------- UseCase -----------------

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(
      network: sl(),
      remote: sl(),
      local: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<FavoriteRemoteDataSource>(
    () => FavoriteRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<FavoriteLocalDataSource>(
    () => FavoriteLocalDataSourceImpl(),
  );
}
