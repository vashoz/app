part of '../config.dart';

Future<void> get categoryDependencies async {
  //! ----------------- Bloc -----------------
  sl.registerFactory(
    () => FindCategoryBloc(
      useCase: sl(),
    ),
  );
  sl.registerFactory(
    () => FindAllCategoriesBloc(
      find: sl(),
      refresh: sl(),
    ),
  );
  sl.registerFactory(
    () => FindFeaturedCategoriesBloc(
      useCase: sl(),
    ),
  );
  sl.registerFactory(
    () => SearchCategoriesBloc(
      useCase: sl(),
    ),
  );

  //! ----------------- UseCase -----------------
  sl.registerFactory(
    () => FindCategoryUseCase(
      repository: sl(),
    ),
  );
  sl.registerFactory(
    () => FindAllCategoriesUseCase(
      repository: sl(),
    ),
  );
  sl.registerFactory(
    () => RefreshAllCategoriesUseCase(
      repository: sl(),
    ),
  );
  sl.registerFactory(
    () => FeaturedCategoriesUseCase(
      repository: sl(),
    ),
  );
  sl.registerFactory(
    () => SearchCategoriesUseCase(
      repository: sl(),
    ),
  );

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(
      network: sl(),
      remote: sl(),
      local: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<CategoriesRemoteDataSource>(
    () => CategoriesRemoteDataSourceImpl(
      client: sl(),
    ),
  );
  sl.registerLazySingleton<CategoriesLocalDataSource>(
    () => CategoriesLocalDataSourceImpl(),
  );
}
