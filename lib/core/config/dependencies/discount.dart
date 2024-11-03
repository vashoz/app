part of '../config.dart';

Future<void> get discountDependencies async {
  //! ----------------- Bloc -----------------

  sl.registerFactory(
    () => FetchDiscountBloc(
      readDiscountUseCase: sl(),
    ),
  );
  //! ----------------- UseCase -----------------

  sl.registerLazySingleton<ReadDiscountUseCase>(
    () => ReadDiscountUseCase(
      repository: sl(),
    ),
  );

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<DiscountRepository>(
    () => DiscountRepositoryImpl(
      network: sl(),
      remote: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<DiscountRemoteDataSource>(
    () => DiscountRemoteDataSourceImpl(
      client: sl(),
    ),
  );
}
