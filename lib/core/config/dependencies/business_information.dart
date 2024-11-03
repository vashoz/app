part of '../config.dart';

Future<void> get businessInformationDependencies async {
  //! ----------------- Bloc -----------------

  sl.registerFactory(
    () => FetchInformationBloc(
      usecase: sl(),
    ),
  );

  //! ----------------- UseCase -----------------

  sl.registerLazySingleton<ReadBusinessInformationUseCase>(
    () => ReadBusinessInformationUseCase(
      repository: sl(),
    ),
  );
  //! ----------------- Repository -----------------
  sl.registerLazySingleton<BusinessInformationRepository>(
    () => BusinessInformationRepositoryImpl(
      network: sl(),
      remote: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<BusinessInformationRemoteDataSource>(
    () => BusinessInformationRemoteDataSourceImpl(
      client: sl(),
    ),
  );
}
