part of '../config.dart';

Future<void> get bannerDependencies async {
  //! ----------------- Bloc -----------------
  sl.registerFactory(
    () => FindBannersBloc(
      find: sl(),
      refresh: sl(),
    ),
  );

  //! ----------------- UseCase -----------------
  sl.registerFactory(
    () => FindBannerUseCase(
      repository: sl(),
    ),
  );
  sl.registerFactory(
    () => RefreshBannerUseCase(
      repository: sl(),
    ),
  );

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<BannerRepository>(
    () => BannerRepositoryImpl(
      network: sl(),
      remote: sl(),
      local: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<BannerRemoteDataSource>(
    () => BannerRemoteDataSourceImpl(
      client: sl(),
    ),
  );
  sl.registerLazySingleton<BannerLocalDataSource>(
    () => BannerLocalDataSourceImpl(),
  );
}
