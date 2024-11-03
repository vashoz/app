part of '../config.dart';

Future<void> get productsDependencies async {
  //! ----------------- Bloc -----------------
  sl.registerFactory(
    () => PopularProductsBloc(
      useCase: sl(),
    ),
  );
  sl.registerFactory(
    () => NewArrivalProductsBloc(
      useCase: sl(),
    ),
  );
  sl.registerFactory(
    () => FindProductBloc(
      useCase: sl(),
    ),
  );
  sl.registerFactory(
    () => FindProductsBloc(
      useCase: sl(),
    ),
  );

  //! ----------------- UseCase -----------------

  sl.registerLazySingleton(
    () => PopularProductsUseCase(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => NewArrivalProductsUseCase(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => FindProductUseCase(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => CategoryUseCase(
      repository: sl(),
    ),
  );

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(
      network: sl(),
      remote: sl(),
      local: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<ProductsLocalDataSource>(
    () => ProductsLocalDataSourceImpl(),
  );
}
